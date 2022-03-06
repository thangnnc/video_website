<div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
	<div class="videoo">
		<div class="vid_thumbainl">
			<a href="${url}/details-video?href=${video.href}" title=""> <img
				src="https://img.youtube.com/vi/${video.href}/maxresdefault.jpg"
				alt=""> <span class="vid-time">${video.videoTime}</span> <span
				class="watch_later"> <i class="icon-watch_later_fill"></i>
			</span>
			</a>
		</div>
		<!--vid_thumbnail end-->
		<div class="video_info">
			<h3>
				<a href="${url}/details-video?href=${video.href}" title="">${video.title}</a>
			</h3>
			<span>${video.views} views .<small class="posted_dt">
					<fmt:formatDate value="${video.dateUpload}" pattern="dd/MM/yyyy" />
			</small></span>
		</div>
	</div>
	<!--videoo end-->
</div>