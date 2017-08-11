package wmt.tcgraphics.test 
{
	import flash.display.Sprite;
	import wmt.tcgraphics.core.TurboCGraphics;
	
	/**
	 * FIXME:
	 */
	public class Test010 extends Sprite
	{	
		private var _tcg:TurboCGraphics;
		
		public function Test010() 
		{
			_tcg = new TurboCGraphics(this.graphics);
			draw();
		}
		
		private function draw():void
		{
			_tcg.initgraph(TurboCGraphics.DETECT, 0, "");
			_tcg.closegraph();
		}
	}
}