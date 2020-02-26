<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Products extends Admin_Controller
{
	/**
	 * Constructor for the class
	 */
	public function __construct()
	{
		parent::__construct();
         $this->load->helper(array('form', 'url'));
		$this->load->model('products_model', 'products');
	}

	/**
	 * Loads the list of products.
	 */
	public function index()
	{
		$this->set_page_title(_l('products'));

		if (!has_permissions('products', 'view'))
		{
			$this->access_denied('products', 'view');
		}
		else
		{
			$data['products'] = $this->products->get_all();
			$data['error']='';
			$data['content']  = $this->load->view('admin/products/index', $data, TRUE);
			$this->load->view('admin/layouts/index', $data);
		}
	}


	/**
	 * Add new project
	 */
	public function add()
	{
		$this->set_page_title(_l('products').' | '._l('add'));

		if (!has_permissions('products', 'create'))
		{
			$this->access_denied('products', 'create');
		}
		else

		if ($this->input->post())
		{    
	   		$config['upload_path'] = './uploads/';  
		    $config['file_name'] = $this->input->post('upload_file');          	
	        $config['allowed_types'] = 'gif|jpg|png';
	        $config['max_size'] = 2000;
	        $config['max_width'] = 1500;
	        $config['max_height'] = 1500;
	       
	        $this->load->library('upload', $config);
		      $data = array
				(
			    'id' => 'PRODUCT_'.rand(10, 100),
				'name'        => $this->input->post('name'),
				'description'     => $this->input->post('description'),
				'created'     => date('Y-m-d H:i:s'),
				'file' =>   $config['file_name'],
				//'file'   => implode(" ",$this->upload->data())
			   );	
				 //removing html tags
                $data = array_map( 'strip_tags', $data);

				$insert = $this->products->insert($data);

				if ($insert)
				{
					set_alert('success', _l('_added_successfully', _l('product')));
					log_activity("New Product Created [ID:$insert]");
					redirect('admin/products');
				}
			
			}
			
		else
		{
			$data['content'] = $this->load->view('admin/products/create', '', TRUE);
			$this->load->view('admin/layouts/index', $data);
		}

	}

/**
function to uploads file

*/
 public function uploads()
 {
        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = 2000;
        $config['max_width'] = 1500;
        $config['max_height'] = 1500;

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('profile_image')) 
        {
            $error = array('error' => $this->upload->display_errors());
            $this->load->view('admin/layouts/index', $error);

        }
        else 
        {
            $data = array('file' => $this->upload->data());
            //$data = implode("",$this->upload->data());   


            //$this->products->insert($data);

            $this->load->view('admin/products/test', $data);

        }
    }
	/**
	 * Updates the project record
	 *
	 * @param int  $id  The project id
	 */
	public function edit($id = '')
	{
		$this->set_page_title(_l('products').' | '._l('edit'));

		if (!has_permissions('products', 'edit'))
		{
			$this->access_denied('products', 'edit');
		}
		else

		if ($id)
		{
			$data['product'] = $this->products->get($id);

			if ($this->input->post())
			{
				$data = array
					('id' => $id,
					'name'        => $this->input->post('name'),
					'description'     => $this->input->post('description'),
					'updated'     => date('Y-m-d H:i:s')
				);

				$update = $this->products->update($id, $data);

				if ($update)
				{
					set_alert('success', _l('_updated_successfully', _l('products')));
					log_activity("Product Updated [ID:$id]");
					redirect('admin/products');
				}
			}
			else
			{
				$data['content'] = $this->load->view('admin/products/edit', $data, TRUE);
				$this->load->view('admin/layouts/index', $data);
			}
		}
		else
		{
			redirect('admin/products');
		}
	}

	/**
	 * Deletes the single project record
	 */
	public function delete()
	{
		$id = $this->input->post('id');
		$deleted    = $this->products->delete($id);

		if ($deleted)
		{
			log_activity("Project Deleted [ID:$id]");
			echo 'true';
		}
		else
		{
			echo 'false';
		}
	}

	/**
	 * Deletes multiple project records
	 */
	public function delete_selected()
	{
		$where   = $this->input->post('ids');
		$deleted = $this->products->delete_many($where);

		if ($deleted)
		{
			$ids = implode(',', $where);
			log_activity("products Deleted [IDs: $ids]");
			echo 'true';
		}
		else
		{
			echo 'false';
		}
	}
}
