package com.soma.core.tests.suites.commands {
	import flash.events.Event;
	import org.flexunit.async.Async;
	import com.soma.core.tests.suites.support.TestAsyncCommand;
	import com.soma.core.tests.suites.support.EmptyModel;
	import org.flexunit.asserts.assertEquals;
	import com.soma.core.tests.suites.support.TestParallelCommand;
	import org.flexunit.asserts.fail;
	import org.flexunit.asserts.assertFalse;
	import flash.display.Sprite;
	import org.flexunit.asserts.assertTrue;
	import com.soma.core.tests.suites.support.TestCommand;
	import com.soma.core.tests.suites.support.TestEvent;
	import com.soma.core.interfaces.ISoma;
	import com.soma.core.Soma;
	import flash.display.Stage;
	import mx.core.FlexGlobals;
	
		private var _soma:ISoma;
		private var _executed:Boolean;
		
		private static var _stage:Stage;
		
		} 
			_soma.addEventListener(TestEvent.TEST, setUserAccessFromInstance);
			_spriteTestAccess.addEventListener(TestEvent.TEST, setUserAccessFromDisplayList);
			_spriteTestAccess = null;
			_spriteTestAccess.dispatchEvent(new TestEvent(TestEvent.TEST, this));
		}

		[Test]
			defaultCheck();
			soma.addCommand(TestEvent.TEST, TestAsyncCommand);
			soma.addEventListener(TestEvent.TEST_ASYNC_COMPLETE, Async.asyncHandler(this, testAsyncCommandSuccess, 500, soma, testAsyncCommandFailed), false, 0, true);
			else if (_userAccessFromInstanceCount > 1) fail("User had access to the command from the framework twice");
			else if (_executed && _userAccessFromDisplayList) fail("User had access to the command from the display list");