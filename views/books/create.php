
	<form action="/books/create" method="post" accept-charset="utf-8" name="create_book">
		<h2>Create book</h2>
		
		<?php if($this->session->flashdata('msg')): ?>
			<p class="flashdata"><?php echo $this->session->flashdata('msg'); ?></div>
		<?php endif; ?>	
		
		<?php echo validation_errors(); ?>
	
		<div>
			<span class="required">*</span> Required field
		</div>
		<div>
			<label for="isbn">ISBN:<span class="required">*</span></label>
			<input type="input" name="isbn" id="isbn" placeholder="101-1000000001" value="" />
		</div>
		<div>
			<label for="title">Title:<span class="required">*</span></label>
			<input type="input" name="title" id="title" placeholder="My book title" />
		</div>
		<div>
			<label for="author">Author:<span class="required">*</span></label>
			<input type="input" name="author" id="author"  placeholder="John Doe" />
		</div>
		<div>
			<label for="category">Category:<span class="required">*</span></label>
			<input type="input" name="category" id="category"  placeholder="PHP" />
		</div>
		<div>
			<label for="cost">Cost:<span class="required">*</span></label>
			<input type="input" name="cost" id="cost" placeholder="0.00" />
		</div>
		<div>
			<label for="currency">Currency:<span class="required">*</span></label>
			<input type="input" name="currency" id="currency" placeholder="GBP" />
		</div>		
		<div>
			<input type="submit" name="submit" value="submit">
		</div>
	</form>		