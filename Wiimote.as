package reid.jon.wiimote {
	
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import reid.jon.wiimote.org.fwiidom.osc.*; 
	
	public class Wiimote extends MovieClip{
		public var oscConn:OSCConnection;
 		public const STR_LOCAL_IP:String = "localhost";
 		public const STR_REMOTE_IP:String = "localhost";
 		static const NUM_PORT:Number = 3000;
 		public var IRoutput:Array;
		public var _IRx:Number = 0;
		public var _IRy:Number = 0;
 		public var IR1output1:Array;
		public var _IRx1:Number = 0;
		public var _IRy1:Number = 0;
		public var _IRz1:Number = 0;
 		public var IR1output2:Array;
		public var _IRx2:Number = 0;
		public var _IRy2:Number = 0;
		public var _IRz2:Number = 0;
 		public var IR1output3:Array;
		public var _IRx3:Number = 0;
		public var _IRy3:Number = 0;
		public var _IRz3:Number = 0;
 		public var IR1output4:Array;
		public var _IRx4:Number = 0;
		public var _IRy4:Number = 0;
		public var _IRz4:Number = 0;
		public var IR2output:Array;
		public var _IR2x:Number = 0;
		public var _IR2y:Number = 0;
 		public var IR2output1:Array;
		public var _IR2x1:Number = 0;
		public var _IR2y1:Number = 0;
		public var _IR2z1:Number = 0;
 		public var IR2output2:Array;
		public var _IR2x2:Number = 0;
		public var _IR2y2:Number = 0;
		public var _IR2z2:Number = 0;
 		public var IR2output3:Array;
		public var _IR2x3:Number = 0;
		public var _IR2y3:Number = 0;
		public var _IR2z3:Number = 0;
 		public var IR2output4:Array;
		public var _IR2x4:Number = 0;
		public var _IR2y4:Number = 0;
		public var _IR2z4:Number = 0;

		public function Wiimote() {
			
			oscConn = new OSCConnection(STR_LOCAL_IP, NUM_PORT);
			oscConn.addEventListener(OSCConnectionEvent.ON_CONNECT, onConnect2);
			oscConn.addEventListener(OSCConnectionEvent.ON_CONNECT_ERROR, onConnectError);
			oscConn.addEventListener(OSCConnectionEvent.ON_CLOSE, onClose2);
			oscConn.addEventListener(OSCConnectionEvent.ON_PACKET_IN, onPacketIn);
			oscConn.addEventListener(OSCConnectionEvent.ON_PACKET_OUT, onPacketOut);
			oscConn.connect();
			
		}
		
		private function onConnect2(evtEvent:OSCConnectionEvent):void {
			trace("Connection established");
			
		}
 
		private function onConnectError(evtEvent:OSCConnectionEvent):void {
			trace("Connection error");
		}
 
		private function onClose2(evtEvent:OSCConnectionEvent):void {
			trace("Connection closed");
		}
 
		private function onSendOSCClick(evtClick:MouseEvent):void {
			//Send the actual OSC packet
			oscConn.sendOSCPacket(new OSCPacket("/appled/0/state", [1], STR_REMOTE_IP, NUM_PORT));
		}

		public function onPacketIn(evtOSC:OSCConnectionEvent):void {
			trace(this + ": onPacketIn: " + evtOSC.data.name + " " + evtOSC.data.data);

	
			if(evtOSC.data.name.indexOf("/wii/1/ir") == 0)
			{
				var IRxyStr:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IRoutput = IRxyStr.split(",",2); 
				_IRx = IRoutput[0];
				_IRy = IRoutput[1];
			}
			
			if(evtOSC.data.name.indexOf("/wii/1/ir/xys/1") == 0)
			{
				var IRxy1Str:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IR1output1 = IRxy1Str.split(",",3); 
				_IRx1 = IR1output1[0];
				_IRy1 = IR1output1[1];
				_IRz1 = IR1output1[2];
			}
			
			if(evtOSC.data.name.indexOf("/wii/1/ir/xys/2") == 0)
			{
				var IRxy2Str:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IR1output2 = IRxy2Str.split(",",3); 
				_IRx2 = IR1output2[0];
				_IRy2 = IR1output2[1];
				_IRz2 = IR1output2[2];
			}
			
			if(evtOSC.data.name.indexOf("/wii/1/ir/xys/3") == 0)
			{
				var IRxy3Str:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IR1output3 = IRxy3Str.split(",",3); 
				_IRx3 = IR1output3[0];
				_IRy3 = IR1output3[1];
				_IRz3 = IR1output3[2];
			}
			
			if(evtOSC.data.name.indexOf("/wii/1/ir/xys/4") == 0)
			{
				var IRxy4Str:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IR1output4 = IRxy4Str.split(",",3); 
				_IRx4 = IR1output4[0];
				_IRy4 = IR1output4[1];
				_IRz4 = IR1output4[2];
			}
			
			
			//SECOND WIIMOTE//
			if(evtOSC.data.name.indexOf("/wii/2/ir") == 0)
			{
				var IR2xyStr:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IR2output = IR2xyStr.split(",",2); 
				_IR2x = IR2output[0];
				_IR2y = IR2output[1];
			}
			
			if(evtOSC.data.name.indexOf("/wii/2/ir/xys/1") == 0)
			{
				var IR2xy1Str:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IR2output1 = IR2xy1Str.split(",",3); 
				_IR2x1 = IR2output1[0];
				_IR2y1 = IR2output1[1];
				_IR2z1 = IR2output1[2];
			}
			
			if(evtOSC.data.name.indexOf("/wii/2/ir/xys/2") == 0)
			{
				var IR2xy2Str:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IR2output2 = IR2xy2Str.split(",",3); 
				_IR2x2 = IR2output2[0];
				_IR2y2 = IR2output2[1];
				_IR2z2 = IR2output2[2];
			}
			
			if(evtOSC.data.name.indexOf("/wii/2/ir/xys/3") == 0)
			{
				var IR2xy3Str:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IR2output3 = IR2xy3Str.split(",",3); 
				_IR2x3 = IR2output3[0];
				_IR2y3 = IR2output3[1];
				_IR2z3 = IR2output3[2];
			}
			
			if(evtOSC.data.name.indexOf("/wii/2/ir/xys/4") == 0)
			{
				var IR2xy4Str:String = new String(evtOSC.data.data);
				//trace(IRxyStr);
		
				IR2output4 = IR2xy4Str.split(",",3); 
				_IR2x4 = IR2output4[0];
				_IR2y4 = IR2output4[1];
				_IR2z4 = IR2output4[2];
			}
		
		}
 
		private function onPacketOut(evtOSC:OSCConnectionEvent):void {
			trace(this + ": onPacketOut: " + evtOSC.data.name + " " + evtOSC.data.data);
		}
		public function testFunction():void
		{
		 trace("it got this far");
		}
		public function get IRx():Number
		{
			return _IRx;
		}
		public function get IRy():Number
		{
			return _IRy;
		}
		public function get IRx1():Number
		{
			return _IRx1;
		}
		public function get IRy1():Number
		{
			return _IRy1;
		}
		public function get IRz1():Number
		{
			return _IRz1;
		}
		public function get IRx2():Number
		{
			return _IRx2;
		}
		public function get IRy2():Number
		{
			return _IRy2;
		}
		public function get IRz2():Number
		{
			return _IRz2;
		}
		public function get IRx3():Number
		{
			return _IRx3;
		}
		public function get IRy3():Number
		{
			return _IRy3;
		}
		public function get IRz3():Number
		{
			return _IRz3;
		}
		public function get IRx4():Number
		{
			return _IRx4;
		}
		public function get IRy4():Number
		{
			return _IRy4;
		}
		public function get IRz4():Number
		{
			return _IRz4;
		}
		
		
		//SECOND WIIMOTE//
		public function get IR2x():Number
		{
			return _IR2x;
		}
		public function get IR2y():Number
		{
			return _IR2y;
		}
		public function get IR2x1():Number
		{
			return _IR2x1;
		}
		public function get IR2y1():Number
		{
			return _IR2y1;
		}
		public function get IR2z1():Number
		{
			return _IR2z1;
		}
		public function get IR2x2():Number
		{
			return _IR2x2;
		}
		public function get IR2y2():Number
		{
			return _IR2y2;
		}
		public function get IR2z2():Number
		{
			return _IR2z2;
		}
		public function get IR2x3():Number
		{
			return _IR2x3;
		}
		public function get IR2y3():Number
		{
			return _IR2y3;
		}
		public function get IR2z3():Number
		{
			return _IR2z3;
		}
		public function get IR2x4():Number
		{
			return _IR2x4;
		}
		public function get IR2y4():Number
		{
			return _IR2y4;
		}
		public function get IR2z4():Number
		{
			return _IR2z4;
		}
	}
	
}

 