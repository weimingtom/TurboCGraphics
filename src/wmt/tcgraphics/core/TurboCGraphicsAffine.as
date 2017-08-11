package wmt.tcgraphics.core 
{
	import flash.display.Graphics;
	
	public class TurboCGraphicsAffine extends TurboCGraphics
	{		
		private var xmax:Number = 639.0;
		private var ymax:Number = 399.0;
		
		private var f:Array = new Array(3);
		private var xx:Number;
		private var yy:Number;
		
		public function TurboCGraphicsAffine(graphics:Graphics) 
		{
			super(graphics);
			for (var i:int = 0; i < f.length; i++)
			{
				f[i] = new Array(3);
			}
		}
		
		public function scx(xj:Number):int
		{
			var x:int;
			x = int(xj + xmax / 2);
			return x;
		}
		
		public function scy(yj:Number):int
		{
			var y:int;
			y = ymax - int(yj + (ymax / 2));
			return y;
		}
		
		public function parallel(dx:Number, dy:Number):void
		{
			f[0][0] = 1.0;
			f[0][1] = 0.0;
			f[0][2] = 0.0;
			
			f[1][0] = 0.0;
			f[1][1] = 1.0;
			f[1][2] = 0.0;
			
			f[2][0] = dx;
			f[2][1] = dy;
			f[2][2] = 1.0;
		}
		
		public function rotate(theta:Number):void
		{
			var th:Number;
			th = theta / 180 * PI;
			f[0][0] = Math.cos(th);
			f[0][1] = Math.sin(th);
			f[0][2] = 0.0;
			
			f[1][0] = - Math.sin(th);
			f[1][1] = Math.cos(th);
			f[1][2] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = 1.0;
		}
		
		public function scale(s:Number):void
		{
			f[0][0] = s;
			f[0][1] = 0.0;
			f[0][2] = 0.0;
			
			f[1][0] = 0.0;
			f[1][1] = s;
			f[1][2] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = 1.0;
		}
		
		public function taisho_x():void
		{
			f[0][0] = 1.0;
			f[0][1] = 0.0;
			f[0][2] = 0.0;
			
			f[1][0] = 0.0;
			f[1][1] = -1.0;
			f[1][2] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = 1.0;
		}
		
		public function taisho_y():void
		{
			f[0][0] = -1.0;
			f[0][1] = 0.0;
			f[0][2] = 0.0;
			
			f[1][0] = 0.0;
			f[1][1] = 1.0;
			f[1][2] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = 1.0;
		}
		
		public function taisho_0():void
		{
			f[0][0] = -1.0;
			f[0][1] = 0.0;
			f[0][2] = 0.0;
			
			f[1][0] = 0.0;
			f[1][1] = 1.0;
			f[1][2] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = 1.0;
		}
		
		public function taisho_xy():void
		{
			f[0][0] = 0.0;
			f[0][1] = 0.0;
			f[0][2] = 0.0;
			
			f[1][0] = 1.0;
			f[1][1] = 0.0;
			f[1][2] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = 1.0;
		}
		
		public function taisho(aa:Number, bb:Number, cc:Number):void
		{
			var r:Number, p:Number;
			r = bb * bb - aa * aa;
			p = aa * aa + bb * bb;
			
			f[0][0] = -r / p;
			f[0][1] = -2.0 * aa * bb / p;
			f[0][2] = 0.0;
			
			f[1][0] = -2.0 * aa * bb / p;
			f[1][1] = -r / p;
			f[1][2] = 0.0;
			
			f[2][0] = -2.0 * aa * cc / p;
			f[2][1] = -2.0 * bb * cc / p;
			f[2][2] = 1.0;
		}
		
		public function shear(c:Number, b:Number):void
		{
			f[0][0] = 1.0;
			f[0][1] = b;
			f[0][2] = 0.0;
			
			f[1][0] = c;
			f[1][1] = 1.0;
			f[1][2] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = 1.0;
		}
		
		public function axis():void
		{
			line(scx(0), scy(-ymax / 2), scx(0), scy(ymax / 2));
			line(scx(-xmax / 2), scy(0.0), scx(xmax / 2), scy(0.0));
		}
		
		public function affinex(x:Number, y:Number, d:Number):Number
		{
			xx = x * f[0][0] + y * f[1][0] + d * f[2][0];
			return xx;
		}
		
		public function affiney(x:Number, y:Number, d:Number):Number
		{
			yy = x * f[0][1] + y * f[1][1] + d * f[2][1];
			return yy;
		}
	}
}