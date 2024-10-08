import utest.Runner;
import utest.ui.Report;

class Main {
	public static function main():Void {
		var runner = new Runner();
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentInvalidXmlTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentObjectTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentRootTagsTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentDeclarationsTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentPropertyTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentBasicBindingTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentBindingTagTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentInlineComponentTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentArrayCollectionTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentModelTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentFullNamespaceTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentDesignLayerTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentLibraryTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentMetadataTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentPrivateTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentReparentTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentScriptTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentStyleTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentSetCallbackTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentMapToCallbackTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentThrowErrorsTest());
		runner.addCase(new mxhx.runtime.MXHXRuntimeComponentValidateOnlyTest());

		#if (html5 && playwright)
		// special case: see below for details
		setupHeadlessMode(runner);
		#else
		// a report prints the final results after all tests have run
		Report.create(runner);
		#end

		// don't forget to start the runner
		runner.run();
	}

	#if (js && playwright)
	/**
		Developers using continuous integration might want to run the html5
		target in a "headless" browser using playwright. To do that, add
		-Dplaywright to your command line options when building.

		@see https://playwright.dev
	**/
	private function setupHeadlessMode(runner:Runner):Void {
		new utest.ui.text.PrintReport(runner);
		var aggregator = new utest.ui.common.ResultAggregator(runner, true);
		aggregator.onComplete.add(function(result:utest.ui.common.PackageResult):Void {
			Reflect.setField(js.Lib.global, "utestResult", result);
		});
	}
	#end
}
