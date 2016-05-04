<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template name="block-user-agent">
	<xsl:param name="title" select="'This website uses technologies your browser does not support.'" />
	<xsl:param name="subtitle" select="'Please upgrade now usign the links below.'" />
	<xsl:param name="close" select="'Click here if you still want to access the site.'" />
	<xsl:param name="firefox" select="true()" />
	<xsl:param name="chrome" select="true()" />
	<xsl:param name="opera" select="true()" />
	<xsl:param name="ie" select="true()" />
	<xsl:param name="client-side-detection" select="false()" />
	
	<xsl:if test="/data/params/block-user-agent = 'Yes' or (string-length(/data/params/block-user-agent-regex) != 0 and $client-side-detection = true())">
		<div id="block-user-agent">
			<xsl:if test="$client-side-detection = true()">
				<xsl:attribute name="style">display:none;</xsl:attribute>
			</xsl:if>
		<style type="text/css" scoped="">
			#block-user-agent-content {font-family:Arial,Helvetica,sans-serif;margin:0;padding:0;}
			#block-user-agent-background{position:fixed;width:100%;height:100%;background-color: black; opacity:0.8;z-index: 1000000;top:0;left:0;right:0;bottom:0;}
			#block-user-agent-content{position:fixed;margin:auto;width:80%;height:400px;text-align:center;z-index: 1000001; top: 50%;left: 50%; margin-top:-200px; margin-left:-40%;}
			#block-user-agent-content-wrap{position:relative;}
			#block-user-agent-warning {margin: 0 auto;display:block;width:60px;height:54px; background: transparent url(/extensions/block_user_agent/assets/warning.png) no-repeat 50% 0%;} 
			#block-user-agent-title{margin-top:30px;font-size:20px;font-weight:bold;color:#FFFFFF;height:25px;}
			#block-user-agent-subTitle{font-size:17px;margin-top:5px;color:#FFFFFF;}
			#block-user-agent-browsers{margin:30px auto 0 auto;width:80%;}
			.block-user-agent-browser{margin: 0 25px 0 25px;display:inline-block;width:110px;vertical-align:top;}
			.block-user-agent-browser span{display:block;margin-top:5px;font-size:12px;line-height:14px;}
			.block-user-agent-browser a{border:none;padding:50px 1px 1px 1px;display:block;color:#FFFFFF;text-decoration:none;position:relative;width:50px;height:50px;background-position:50% 0%;background-repeat:no-repeat;}
			.block-user-agent-browser a:hover{text-decoration:none;padding:49px 0 0 0;border:1px solid white;}
			.block-user-agent-browser a.block-user-agent-firefox{background-image:url(/extensions/block_user_agent/assets/firefox-logo.png);}
			.block-user-agent-browser a.block-user-agent-chrome {background-image:url(/extensions/block_user_agent/assets/google-chrome-logo.png);}
			.block-user-agent-browser a.block-user-agent-opera  {background-image:url(/extensions/block_user_agent/assets/opera-logo.png);}
			.block-user-agent-browser a.block-user-agent-ie     {background-image:url(/extensions/block_user_agent/assets/ie9-logo.png);}
			#block-user-agent-closePop{width:100%;position:absolute;bottom:-80px;font-size:16px;color:#FFFFFF;}
			#block-user-agent-closePop a{display:inline-block;width:18px;height:18px;margin-right:20px;color:#FFFFFF;text-decoration:none;border:1px solid white;padding:6px 7px 4px 7px;}
			#block-user-agent-closePop a:hover{background-color:#FFFFFF;color:#000000;}
			#block-user-agent-content a img{border:0;}
		</style>
		<script>
			function block_user_agent_close() {
				var bg = document.getElementById('block-user-agent-background');
				var ct = document.getElementById('block-user-agent-content');
				try {
					document.body.removeChild(bg);
					document.body.removeChild(ct);
				} catch (ex) {
					bg.parentNode.removeChild(bg);
					ct.parentNode.removeChild(ct);
				}
			};
		</script>
		<div id="block-user-agent-background"></div>
		<div id="block-user-agent-content">
			<div id="block-user-agent-content-wrap">
				<div id="block-user-agent-warning"></div>
				<p id="block-user-agent-title">
					<xsl:value-of select="$title" />
				</p>
				
				<xsl:if test="string-length($subtitle) != 0">
					<p id="block-user-agent-subTitle">
						<xsl:value-of select="$subtitle" />
					</p>
				</xsl:if>
				
				<div id="block-user-agent-browsers">
					<xsl:if test="$firefox = true()">
						<div class="block-user-agent-browser">
							<a href="http://www.mozilla.com/firefox/" class="block-user-agent-firefox" target="_blank" title="Firefox">
								<span>Firefox</span>
							</a>
						</div>
					</xsl:if>
					<xsl:if test="$chrome = true()">
						<div class="block-user-agent-browser">
							<a href="http://www.google.com/chrome/" class="block-user-agent-chrome" target="_blank" title="Chrome">
								<span>Google Chrome</span>
							</a>
						</div>
					</xsl:if>
					<xsl:if test="$opera = true()">
						<div class="block-user-agent-browser">
							<a href="http://www.opera.com/download/" class="block-user-agent-opera" target="_blank" title="Opera">
								<span>Opera</span>
							</a>
						</div>
					</xsl:if>
					<xsl:if test="$ie = true()">
						<div class="block-user-agent-browser">
							<a href="http://www.microsoft.com/windows/internet-explorer/" class="block-user-agent-ie" target="_blank" title="Internet Explorer">
								<span>Internet Explorer</span>
							</a>
						</div>
					</xsl:if>
				</div>
				<div id="block-user-agent-closePop">
					<span>
						<a href="#" onclick="block_user_agent_close()">X</a>
						<xsl:value-of select="$close" />
					</span>
				</div>
			</div>
		</div>
		
		<xsl:if test="string-length(/data/params/block-user-agent-regex) != 0 and $client-side-detection = true()">
			<script>
				(function (d, n) {
					if (!<xsl:value-of select="/data/params/block-user-agent-regex" />.test(navigator.userAgent.toString())) {
						try {
							d.body.removeChild(n);
						} catch (ex) {
							n.parentNode.removeChild(n);
						}
					} else {
						n.setAttribute('style','');
					}
				})(document, document.getElementById('block-user-agent'))
			</script>
		</xsl:if>
		
		</div>
	</xsl:if>
</xsl:template>

<xsl:template name="block-user-agent-light">
	<xsl:param name="text" select="'This website uses technologies your browser does not support.'" />
	<xsl:param name="client-side-detection" select="false()" />
	
	<xsl:if test="/data/params/block-user-agent = 'Yes' or (string-length(/data/params/block-user-agent-regex) != 0 and $client-side-detection = true())">
		<div id="block-user-agent">
			<xsl:if test="$client-side-detection = true()">
				<xsl:attribute name="style">display:none;</xsl:attribute>
				<xsl:attribute name="onclick">this.innerHTML='';</xsl:attribute>
			</xsl:if>
			<style type="text/css" scoped="">
				<xsl:text>#block-user-agent-ctn {</xsl:text>
					<xsl:text>position: fixed;</xsl:text>
					<xsl:text>top: 0;</xsl:text>
					<xsl:text>left: 0;</xsl:text>
					<xsl:text>right: 0;</xsl:text>
					<xsl:text>bottom: auto;</xsl:text>
					<xsl:text>z-index: 2147483647;</xsl:text>
					<xsl:text>background-color: #000;</xsl:text>
					<xsl:text>background-color: rgba(0, 0, 0, 0.6);</xsl:text>
					<xsl:text>color: #FFF;</xsl:text>
					<xsl:text>font-weight: bold;</xsl:text>
					<xsl:text>font-size: 1.5em;</xsl:text>
					<xsl:text>font-family: inherit;</xsl:text>
					<xsl:text>line-height: 2em;</xsl:text>
					<xsl:text>vertical-align: middle;</xsl:text>
					<xsl:text>padding: 1em;</xsl:text>
					<xsl:text>margin: 0;</xsl:text>
					<xsl:text>cursor: hand;</xsl:text>
					<xsl:text>cursor: pointer;</xsl:text>
				<xsl:text>}</xsl:text>
				<xsl:text>#block-user-agent-content {</xsl:text>
					<xsl:text>max-width: 700px;</xsl:text>
					<xsl:text>margin: 0 auto;</xsl:text>
					<xsl:text>text-align: center;</xsl:text>
				<xsl:text>}</xsl:text>
			</style>
			<div id="block-user-agent-ctn">
				<div id="block-user-agent-content" data-message="{$text}"></div>
			</div>
			
			<xsl:if test="string-length(/data/params/block-user-agent-regex) != 0 and $client-side-detection = true()">
				<script>
					<xsl:text>(function (d, n, c) {</xsl:text>
						<xsl:text>if (!</xsl:text>
						<xsl:value-of select="/data/params/block-user-agent-regex" />
						<xsl:text>.test(navigator.userAgent.toString())) {</xsl:text>
							<xsl:text>n.innerHTML = '';</xsl:text>
						<xsl:text>} else {</xsl:text>
							<xsl:text>if (c.getAttribute) {</xsl:text>
								<xsl:text>c.innerHTML = c.getAttribute('data-message');</xsl:text>
							<xsl:text>}</xsl:text>
							<xsl:text>else {</xsl:text>
								<xsl:text>c.innerHTML = c.attributes[1];</xsl:text>
							<xsl:text>}</xsl:text>
							<xsl:text>n.setAttribute('style','');</xsl:text>
						<xsl:text>}</xsl:text>
					<xsl:text>})(document, document.getElementById('block-user-agent'), document.getElementById('block-user-agent-content'))</xsl:text>
				</script>
			</xsl:if>
		</div>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>