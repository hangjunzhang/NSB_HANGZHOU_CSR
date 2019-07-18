/*
*
*   example
*
*	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
*	<script src="http://libs.baidu.com/zepto/0.8/zepto.min.js"></script>
*	<script src="jquery.h5fiileupload.js"></script>
*	<img width=100 height=100 class="preview" />
*	<div class="fileupload" style="font-size:40px" >点我上传</div>
*	<script>
*		$(function(){
*			$(".fileupload").uploadFile({
*				url : 'photo.php?action=2',
*				submitFormFileName : 'uploadFile',
*				onStartUpload : function(fileDataURL){
*					console.log(fileDataURL);
*					$(".preview").attr('src',fileDataURL);
*				},
*				onSelected : function(fileDataURL){
*					console.log(fileDataURL);
*				},
*				onProgress : function(fileDataURL,loaded,total){
*					console.log('onProgress');
*					console.log(loaded+'/'+total);
*				},
*				onFinished : function(fileDataURL,data){
*					console.log('onFinished');
*					console.log(data);
*				},
*				onError : function(fileDataURL,data){
*					console.log('onError');
*					console.log(data);
*				}
*			});
*		});
*	</script>
*
*
*/

	$.fn.uploadFile = function(options){
		var $this = $(this);
		var defaultOptions = {
			url : '',
			accept:'',
			success_action_status:'201',
			inputIDPrefix : 'fileuploadinput_',
			onSelected : $.noop,
			onStartUpload : $.noop,
			onProgress : $.noop,
			onFinished : $.noop,
			onError : $.noop
		}
		$.extend(defaultOptions, options);
        var taskid = ''
		if($this.attr('data-id')){
			taskid = $this.attr('data-id')
		}
		$this.click(function(){
			var $fileInput = $(createFileInput(defaultOptions['accept']));
				$fileInput.appendTo('body');
				$fileInput.on('change', function (e) {
					$fileInput.remove();
					var files = e.target.files || e.dataTransfer.files;
					var freader = new FileReader();
						freader.readAsDataURL(files[0]);
						freader.onload=function(e){
						var fileDataURL = e.target.result;
							defaultOptions.onSelected && defaultOptions.onSelected(fileDataURL);
							setTimeout(function(){ //fixed micromsg browser flush
								upload(files[0],fileDataURL,taskid);
							},150);
						}
				});
				$fileInput[0].click();
		});
	
		
		function createFileInput(fileaccept){
			var fileInput = document.createElement('input');
				fileInput.type='file';
				fileInput.accept= fileaccept;
				fileInput.style.display='none';
			return fileInput;
		}
		
		function upload(file,fileDataURL,taskid){
			var formdata = new FormData();
			formdata.append('file',file);
			formdata.append('taskid',taskid);
			if(defaultOptions.path){
				formdata.append('path',defaultOptions.path);
			}
			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener("progress",function(e){
				defaultOptions.onProgress && defaultOptions['onProgress'](fileDataURL, e.loaded, e.total,$this);
			}, false);
			xhr.addEventListener("load", function(e){
				defaultOptions.onFinished && defaultOptions.onFinished(fileDataURL, xhr.responseText,file.name,$this);
			}, false);
			xhr.addEventListener("error", function(e){
				defaultOptions.onError && defaultOptions.onError(fileDataURL, xhr.responseText);
			}, false);
			xhr.open("POST",defaultOptions['url'], true);
			//xhr.setRequestHeader("X_FILENAME", file.name);
			xhr.send(formdata);
			defaultOptions.onStartUpload && defaultOptions.onStartUpload(fileDataURL);
		}
		return $this;
	}
