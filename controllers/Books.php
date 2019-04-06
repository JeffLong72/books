<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Books extends CI_Controller {

	public function search()
	{
		// enable profiler
		// $this->output->enable_profiler(TRUE);
		
		// get url params
		$category = $this->uri->segment(4);
		$author = $this->uri->segment(6);
		
		// load model(s)
		$this->load->model('Books_model');
		
		// get data
		$data = $this->Books_model->get_books($category, $author);	
		
		// load view
		$this->load->view('books/index.php', $data);
	}
	
	public function create()
	{
		// enable profiler
		// $this->output->enable_profiler(TRUE);
		
		// load files
		$this->load->helper('form');
		$this->load->library('form_validation');
		$this->load->model('Books_model');

		// set validation rules
		$this->form_validation->set_rules('isbn', 'ISBN', 'required');
		$this->form_validation->set_rules('title', 'Title', 'required');
		$this->form_validation->set_rules('author', 'Author', 'required');
		$this->form_validation->set_rules('category', 'Category', 'required');
		$this->form_validation->set_rules('cost', 'Cost', 'required');
		$this->form_validation->set_rules('currency', 'Currency', 'required');		
				
		if ($this->form_validation->run() === FALSE) { 
			// the view file outputs the validation errors
		}
		else{ 
			// attempt to create book
			echo $this->Books_model->set_book();
			return;
		}
		
		// load view
		$this->load->view('books/create.php', '');	
		
	}
}
