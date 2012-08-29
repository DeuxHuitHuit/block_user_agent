<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceblock_user_agent extends Datasource{

		public $dsParamROOTELEMENT = 'block-user-agent';

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Accueil',
				'author' => array(
					'name' => 'Deux Huit Huit',
					'website' => 'http://www.deuxhuithuit.com',
					'email' => 'open-source@deuxhuithuit.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-08-29T00:00:00+00:00'
			);
		}

		public function getSource(){
			return 'Block User Agent';
		}

		public function allowEditorToParse(){
			return false;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
