/*
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
 */

package mxhx.runtime;

import mxhx.parser.MXHXParserProblem;
import mxhx.resolver.IMXHXResolver;
import mxhx.parser.MXHXParser;

typedef MXHXRuntimeOptions = {
	/**
		Optionally provide a `Map` to be populated with all components in the
		MXHX document that have an id. The maps keys are the ids, and the values
		are the instances with those ids.
	**/
	var ?idMap:Map<String, Any>;

	/**
		An optional callback to get the `IMXHXData` generated from the source
		code.
	**/
	var ?mxhxDataCallback:(IMXHXData) -> Void;

	/**
		An optional callback to get the instance for each tag in the document.
	**/
	var ?tagCallback:(IMXHXTagData, Any) -> Void;

	/**
		Optionally provide a custom `MXHXParser` instance.
	**/
	var ?createMXHXParser:(sourceCode:String, filePath:String) -> MXHXParser;

	/**
		Optionally provide a custom `IMXHXResolver` instance.
	**/
	var ?createMXHXResolver:() -> IMXHXResolver;

	/**
		Optionally provide an array to store problems instead of throwing them.
	**/
	var ?problems:Array<MXHXParserProblem>;

	/**
		Optionally set to `false` to disable throwing errors as exceptions. A
		value of `null` is considered the same as `true`.

		When exception throwing is disabled, errors will be added to
		`MXHXRuntimeOptions.problems`, if avaiable. Additionally,
		`MXHXRuntimeComponent` will attempt to continue parsing the MXHX source
		and return a value. However, it may still return `null`.
	**/
	var ?throwErrors:Bool;
}
