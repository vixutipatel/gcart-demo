<!-- Page header -->
<div class="page-header page-header-default">
	<div class="page-header-content">
		<div class="page-title">
			<h4>
				<span class="text-semibold"><?php _el('edit_project'); ?></span>
			</h4>
		</div>
	</div>
	<div class="breadcrumb-line">
		<ul class="breadcrumb">
			<li>
				<a href="<?php echo base_url('admin/dashboard'); ?>"><i class="icon-home2 position-left"></i><?php _el('dashboard'); ?></a>	
			</li>
			<li>
				<a href="<?php echo base_url('admin/projects'); ?>"><?php _el('projects'); ?></a>
			</li>
			<li class="active"><?php _el('edit'); ?></li>
		</ul>
	</div>
</div>
<!-- /Page header -->
<!-- Content area -->
<div class="content">
	<form action="<?php echo base_url('admin/projects/edit/').$project['id']; ?>" id="projectform" method="POST">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<!-- Panel -->
				<div class="panel panel-flat">
					<!-- Panel heading -->
					<div class="panel-heading">
						<div class="row">
							<div class="col-md-10">
								<h5 class="panel-title">
									<strong><?php _el('project'); ?></strong>
								</h5>
							</div>
						</div>
					</div>
					<!-- /Panel heading -->
					<!-- Panel body -->
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<small class="req text-danger">*</small>
									<label><?php _el('project_name'); ?>:</label>
									<input type="text" class="form-control" placeholder="<?php _el('project_name'); ?>" id="name" name="name" value="<?php echo $project['name']; ?>">
								</div>
								<div class="form-group">						
									<label><?php _el('description'); ?>:</label>
									<input type="text" class="form-control" placeholder="<?php _el('description'); ?>" id="details" name="details" value="<?php echo $project['details']; ?>">
								</div>
							</div>
						</div>
					</div>
					<!-- /Panel body -->
				</div>
				<!-- /Panel -->
			</div>
		</div>
		<div class="btn-bottom-toolbar text-right btn-toolbar-container-out">
		<button type="submit" class="btn btn-success" name="submit"><?php _el('save'); ?></button>
		<a class="btn btn-default" onclick="window.history.back();"><?php _el('back'); ?></a>
		</div>
	</form>
</div>
<!-- /Content area -->

<script type="text/javascript">
$("#projectform").validate({
	rules: {
		name:
		{
			required: true,
		},	
	},
	messages: {
		name: 
		{
			required:"<?php _el('please_enter_', _l('project_name')) ?>",
		},
	}
});  
</script>

