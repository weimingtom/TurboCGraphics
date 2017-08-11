package wmt.tcgraphics.test 
{
	import flash.display.Sprite;
	import wmt.tcgraphics.core.TurboCGraphics;
	
	public class Test008 extends Sprite
	{	
		private var _tcg:TurboCGraphics;
		
		public function Test008() 
		{
			_tcg = new TurboCGraphics(this.graphics);
			draw();
		}
		
		private function draw():void
		{
			var n:int = -1;
			var m:int = 36;
			var x:int;
			var y:int;
			var bx:int;
			var by:int;
			//var px:int;
			//var py:int;
			var i:int = 0;
			var pi:Number = TurboCGraphics.PI;
			//var a:Number;
			var x1:Array = new Array(121);
			var y1:Array = new Array(121);
			var x2:Array = new Array(121);
			var y2:Array = new Array(121);
			
			_tcg.initgraph(TurboCGraphics.DETECT, 0, "");
			for (var a:Number = 0; a <= 2 * pi; a += pi / 60)
			{
				i++;
				x1[i] = 26 * Math.cos(a);
				y1[i] = 36 * Math.cos(2 * a);
				x2[i] = 26 * Math.cos(a);
				y2[i] = 36 * Math.sin(a);
			}
			for (var px:int = 170; px <= 470; px += 60)
			{
				for (var py:int = 50; py <= 350; py += 60)
				{
					n++;
					for (i = 1; i < 120; i++)
					{
						x = (x2[i] - x1[i]) / m * n + x1[i];
						y = (y2[i] - y1[i]) / m * n + y1[i];
						x += px;
						y += py;
						if (i == 1)
						{
							bx = int(x);
							by = int(y / 1.2);
							_tcg.moveto(bx, by);
						}
						_tcg.lineto(x, int(y / 1.2));
					}
					_tcg.lineto(bx, by);
				}
			}
			_tcg.rectangle(130, 10, 510, 320);
			_tcg.closegraph();
		}
	}
}