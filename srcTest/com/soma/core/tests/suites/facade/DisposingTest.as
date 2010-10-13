package com.soma.core.tests.suites.facade {
	import org.flexunit.asserts.fail;
	import org.flexunit.async.Async;
	import com.soma.core.tests.suites.support.TestSequenceCommand;
	import com.soma.core.tests.suites.support.EmptyView;
	import com.soma.core.tests.suites.support.EmptyModel;
	import com.soma.core.tests.suites.support.EmptyWire;
	import com.soma.core.tests.suites.support.TestAsyncCommand;
	import com.soma.core.tests.suites.support.TestEvent;
	import org.flexunit.asserts.assertNull;
	import com.soma.core.Soma;
	import flash.display.Stage;
	import mx.core.FlexGlobals;
	

		private var _soma:Soma;
		private static var _stage:Stage;
		
		public static function runBeforeClass():void {
			_stage = FlexGlobals.topLevelApplication.stage;
			_soma.addCommand(TestEvent.TEST, TestAsyncCommand);
			_soma.addWire(EmptyWire.NAME, new EmptyWire());
			assertNull(_soma.stage);
			assertNull(_soma.wires);
			assertNull(_soma.getWire(EmptyWire.NAME));
			assertNull(_soma.controller);
			fail("Dispose method not called in element: " + obj);
		}

		private function disposeCallSuccess(e:Event, obj:Object):void {
		}
		
		[Test(async)]