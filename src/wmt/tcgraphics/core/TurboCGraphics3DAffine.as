package wmt.tcgraphics.core 
{
	import flash.display.Graphics;
	
	public class TurboCGraphics3DAffine extends TurboCGraphics
	{		
		private var xx:Array = new Array(20);
		private var yy:Array = new Array(20);
		private var zz:Array = new Array(20);
		private var iver:Array = new Array(6);
		private var f:Array = new Array(4);
		private var d:Array = new Array(60);
		private var iv:int, ief:int, ie:int;
		private var i:int, j:int, m:int, v:int;
		private var th1:Number, th2:Number, th:Number;
		private var x:Number, y:Number, z:Number;
		private var x0:Number, y0:Number, z0:Number;
		private var ch:uint;
		private var wxr:Number, wyt:Number, wxl:Number, wyb:Number;
		private var vxl:Number, vyb:Number, vxr:Number, vyt:Number;
		private var a:Number, b:Number, c:Number;
		private var tx:Number, ty:Number, tz:Number;
		private var dx:Number, dy:Number, dz:Number;
		
		public function TurboCGraphics3DAffine(graphics:Graphics) 
		{
			super(graphics);
			var i:int;
			for (i = 0; i < 4; i++)
			{
				f[i] = new Array(4);
			}
			for (i = 0; i < 6; i++)
			{
				iver[i] = new Array(100);
			}
		}
		
		
		public function axis():void
		{
			line(320, 240, 620, 240);
			line(320, 240, 320, 100);
		}
		
		public function parallel(dx:Number, dy:Number, dz:Number):void
		{
			f[0][0] = 1.0;
			f[0][1] = 0.0;
			f[0][2] = 0.0;
			f[0][3] = 0.0;
			
			f[1][0] = 0.0;
			f[1][1] = 1.0;
			f[1][2] = 0.0;
			f[1][3] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = 1.0;
			f[2][3] = 0.0;
			
			f[3][0] = dx;
			f[3][1] = dy;
			f[3][2] = dz;
			f[3][3] = 1.0;
		}
		
		public function scale(sz:Number, sy:Number, sz:Number):void
		{
			f[0][0] = sx;
			f[0][1] = 0.0;
			f[0][2] = 0.0;
			f[0][3] = 0.0;
			
			f[1][0] = 0.0;
			f[1][1] = sy;
			f[1][2] = 0.0;
			f[1][3] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = sz;
			f[2][3] = 0.0;
			
			f[3][0] = 0.0;
			f[3][1] = 0.0;
			f[3][2] = 0.0;
			f[3][3] = 1.0;
		}

		public function rotate_x(theta_x:Number):void
		{
			var co:Number = Math.cos(theta_x);
			var si:Number = Math.sin(theta_x);
			
			f[0][0] = 1.0;
			f[0][1] = 0.0;
			f[0][2] = 0.0;
			f[0][3] = 0.0;
			
			f[1][0] = 0.0;
			f[1][1] = co;
			f[1][2] = -si;
			f[1][3] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = si;
			f[2][2] = co;
			f[2][3] = 0.0;
			
			f[3][0] = 0.0;
			f[3][1] = 0.0;
			f[3][2] = 0.0;
			f[3][3] = 1.0;
		}
		
		public function rotate_y(theta_y:Number):void
		{
			var co:Number = Math.cos(theta_y);
			var si:Number = Math.sin(theta_y);
			
			f[0][0] = co;
			f[0][1] = 0.0;
			f[0][2] = si;
			f[0][3] = 0.0;
			
			f[1][0] = 0.0;
			f[1][1] = 1.0;
			f[1][2] = 0.0;
			f[1][3] = 0.0;
			
			f[2][0] = -si;
			f[2][1] = 0.0;
			f[2][2] = co;
			f[2][3] = 0.0;
			
			f[3][0] = 0.0;
			f[3][1] = 0.0;
			f[3][2] = 0.0;
			f[3][3] = 1.0;
		}
		
		public function rotate_z(theta_z:Number):void
		{
			var co:Number = Math.cos(theta_z);
			var si:Number = Math.sin(theta_z);
			
			f[0][0] = co;
			f[0][1] = -si;
			f[0][2] = 0.0;
			f[0][3] = 0.0;
			
			f[1][0] = si;
			f[1][1] = co;
			f[1][2] = 0.0;
			f[1][3] = 0.0;
			
			f[2][0] = 0.0;
			f[2][1] = 0.0;
			f[2][2] = 1.0;
			f[2][3] = 0.0;
			
			f[3][0] = 0.0;
			f[3][1] = 0.0;
			f[3][2] = 0.0;
			f[3][3] = 1.0;
		}
		
		public function rotate_any(x1:Number, y1:Number, z1:Number, x2:Number, y2:Number, z2:Number, th:Number):void
		{
			var lmn:Number = Math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1));
			var l:Number = (x2 - x1) / lmn;
			var m:Number = (y2 - y1) / lmn;
			var n:Number = (z2 - z1) / lmn;
			var co:Number = Math.cos(th);
			var si:Number = Math.sin(th);
			
			f[0][0] = l * l + (1 - l * l) * co;
			f[0][1] = l * m * (1 - co) + n * si;
			f[0][2] = l * n * (1 - co) - m * si;
			f[0][3] = 0.0;
			
			f[1][0] = l * m * (1 - co) - n * si;
			f[1][1] = m * m + (1 - m * m) * co;
			f[1][2] = n * m * (1 - co) + l * si;
			f[1][3] = 0.0;
			
			f[2][0] = l * n * (1 - co) + m * si;
			f[2][1] = m * n * (1 - co) - l * si;
			f[2][2] = n * n + (1 - n * n) * co;
			f[2][3] = 0.0;
			
			f[3][0] = 0.0;
			f[3][1] = 0.0;
			f[3][2] = 0.0;
			f[3][3] = 1.0;
		}
	}
}