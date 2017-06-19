package;

import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Project {
	private var video: kha.Video;

	public function new() {
		Assets.loadEverything(function () {
			System.notifyOnRender(render);
			Scheduler.addTimeTask(update, 0, 1 / 60);
			kha.capture.Video.init(function (video) {
				this.video = video;
			}, function () {
				trace("Capture error");
			});
		});
	}

	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {
		var g = framebuffer.g2;
		g.begin();
		if (video != null) {
			g.drawVideo(video, 20, 20, 800, 400);
		}
		g.end();
	}
}
