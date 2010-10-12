<?php
echo "Hello";
if(!empty($this->data))
	{
		//print_r($this->product_list);
		echo json_encode($this->data);
	}
?>