<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/third_party/Google/autoload.php';

class Calendar extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('google');
	}

	function index()
	{
		echo $this->google->getLibraryVersion();
		//outputnya adalah : 1.1.5
	}
}
