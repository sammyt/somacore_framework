package com.soma.core.tests.suites.facade {
	import com.soma.debugger.SomaDebugger;
	import flash.display.Sprite;
	import org.hamcrest.object.instanceOf;
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertNull;
	import com.soma.core.interfaces.ISomaPlugin;
	import org.flexunit.asserts.assertNotNull;
	import flash.display.Stage;
	import com.soma.core.interfaces.ISoma;
	import mx.core.FlexGlobals;
	import com.soma.core.Soma;
	
		private var _soma:ISoma;
		private static var _stage:Stage;
		
		[BeforeClass]
		public static function runAfterClass():void {
			_stage = null;
		public function runBefore():void {
			