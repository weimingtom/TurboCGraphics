package wmt.tcgraphics.test 
{
	import flash.display.Sprite;
	import wmt.tcgraphics.core.TurboCGraphics;
	
	public class Test004 extends Sprite
	{	
		private var _tcg:TurboCGraphics;
		
		public function Test004() 
		{
			_tcg = new TurboCGraphics(this.graphics);
			draw();
		}
		
		private function draw():void
		{	
			var r:Number = 80;
			var n:int = 45;
			var x:Number, y:Number;
			var theta:Number = 2.0 * TurboCGraphics.PI / n;
			_tcg.initgraph(TurboCGraphics.DETECT, 0, "");
			_tcg.circle(320, 210, r);
			for (var i:int = 0; i < n; i++)
			{
				x = r * Math.cos(i * theta);
				y = r * Math.sin(i * theta);
				var rr:Number = Math.sqrt(x * x);
				x = 320.0 + x;
				y = 210.0 - y;
				_tcg.circle(x, y, rr);
			}
			_tcg.closegraph();
		}
	}
}