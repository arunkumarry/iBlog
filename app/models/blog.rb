class Blog < ApplicationRecord
	has_attached_file :image,
	   styles: lambda { |a| a.instance.check_file_type}, default_url: "no_image.png"
	  
	  #validates_attachment_content_type :video, :content_type => /.*/
	  validates_attachment_content_type :image, content_type: ["video/mp4", "image/png", "image/jpeg", 'application/pdf', 'audio/mpeg',
	'text/plain', 'text/html', 'audio/mp3', 'application/zip', 'application/x-zip', 'application/x-zip-compressed']

	before_post_process :skip_for_zip

	def skip_for_zip
	   ! %w(application/zip application/x-zip).include?(@attachment_content_type)
	end

	 def check_file_type
	    if is_image_type?
	      {large: "750x750>", medium: "300x300#", thumb: "100x100#" }
	    elsif is_video_type?
	      {
	          medium: { geometry: "300x300#", format: 'jpg'},
	          video: { geometry: "640x360#", format: 'mp4', processors: [:transcoder]}
	      }
	    elsif is_audio_type?
	      {
	        audio: {
	          format: "mp3", processors: [:transcoder]
	        }
	      }
	    
	    else
	      {}
	    end
	  end


	 def is_image_type?
	    
	   image_content_type =~ %r(image)
	  end

	 
	 def is_video_type?
	    image_content_type =~ %r(video)
	  end

	 
	 def is_audio_type?
	    image_content_type =~ /\Aaudio\/.*\Z/
	  end
end
