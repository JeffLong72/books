<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Books_model extends CI_Model {
	
	public function get_books($category = "", $author = "")
	{
		// replace %20 for space character
		$author = str_replace("%20", " ", $author);

		// search by author
		if(!empty($author)) {
			$sql = ' select isbn 
						from books 
						where author = '.$this->db->escape($author).'
						and active = 1 
						and status = 0 ';
		}

		// get all categories
		if(!empty($category) && $category == "all") {
			$sql = ' select category 
						from books_categories 
						where active = 1 
						and status = 0 
						group by category ';
		}		
		// else get specific category if author is empty
		elseif(!empty($category) && empty($author)) {
			$sql = ' select t2.isbn 
						from books_categories as t1 
						left join books as t2 on t1.book_id = t2.id 
						where t1.category = '.$this->db->escape($category).'
						and t1.active = 1 
						and t2.active = 1
						and t1.status = 0
						and t2.status = 0 ';
		}			

		// if we have both a category name and an author
		if(!empty($category) && !empty($author)) {
			$sql = ' select t2.isbn 
						from books_categories as t1 
						left join books as t2 on t1.book_id = t2.id 
						where t2.author = '.$this->db->escape($author).' 
						and t1.category = '.$this->db->escape($category).'
						and t1.active = 1
						and t2.active = 1 
						and t1.status = 0
						and t2.status = 0 ';
		}
		
		// query the database
		if(!empty($sql)) {
			$query = $this->db->query($sql);
			$result = $query->result_array();
			if(!empty($result)) {
				$result[] = array('response' => '200');
			}
		}
		
		// return result
		echo (!empty($result)) ? json_encode($result) : "";
	}
	
	public function set_book( $data = "") {
		
		// check for valid ISBN formatting
		$isbn_values = explode('-', $this->input->post('isbn'));
	
		// if isbn contains more than 2 [values] (eg. [101]-[100001]) then lets consider that invalid
		if( count($isbn_values) > 2 ) {
			
			// create array for json output
			$result = array();
			$result[] = array('error' => 'Invalid ISBN');
			$result[] = array('response' => '400');
			
			// return result
			return json_encode($result);	
		}
		else {
			// insert data into table: books
			$insert = array( 
							'isbn' => $this->input->post('isbn'),
							'title' => $this->input->post('title'),
							'author' => $this->input->post('author'),
							'active' => 1
							
			);
						
			$this->db->insert('books', $insert);	
			$insert_id = $this->db->insert_id();
			
			// insert data into table: books_categories
			$insert = array( 
							'category' => $this->input->post('category'),
							'book_id' => $insert_id,
							'active' => 1
							
			);
						
			$this->db->insert('books_categories', $insert);	
			
			// insert data into table: books_price
			$insert = array( 
							'cost' => $this->input->post('cost'),
							'currency' => $this->input->post('currency'),
							'book_id' => $insert_id,
							'active' => 1
							
			);
						
			$this->db->insert('books_price', $insert);	

			// create array for json output
			$result = array();
			$result[] = array('isbn' => $this->input->post('isbn'));
			$result[] = array('title' => $this->input->post('title'));
			$result[] = array('author' => $this->input->post('author'));
			$result[] = array('category' => $this->input->post('category'));
			$result[] = array('cost' => $this->input->post('cost'));
			$result[] = array('response' => '201');
			
			// return result
			return json_encode($result);
		}
	}
}
