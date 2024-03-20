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

package mxhx.utils;

/**
	Utility functions for parsing MXHX values from strings.
**/
class MXHXValueTools {
	private static final VALUE_TRUE = "true";
	private static final VALUE_FALSE = "false";
	private static final VALUE_NAN = "NaN";
	private static final VALUE_INFINITY = "Infinity";
	private static final VALUE_NEGATIVE_INFINITY = "-Infinity";

	/**
		Attempts to parse a `Bool` value from the given string. If the string is
		not recognized as a `Bool` value, returns `null`.
	**/
	public static function parseBool(value:String):Null<Bool> {
		value = StringTools.trim(value);
		if (value == VALUE_TRUE || value == VALUE_FALSE) {
			return value == VALUE_TRUE;
		}
		return null;
	}

	/**
		Attempts to parse a `Class` value from the given string. If the string
		is not recognized as a `Class` value, returns `null`.
	**/
	public static function parseClass(value:String):Null<Class<Dynamic>> {
		value = StringTools.trim(value);
		return Type.resolveClass(value);
	}

	/**
		Attempts to parse a value from the given string, where the type the
		value is assigned to is `Dynamic` or `Any`. May return a boolean,
		numeric, or string value.
	**/
	public static function parseDynamicOrAny(value:String):Dynamic {
		var trimmed = StringTools.trim(value);
		if (trimmed == VALUE_TRUE || trimmed == VALUE_FALSE) {
			return trimmed == VALUE_TRUE;
		}
		if (~/^-?[0-9]+?$/.match(trimmed)) {
			var intValue = Std.parseInt(trimmed);
			var intAsFloatValue = Std.parseFloat(trimmed);
			if (intValue != null && intValue == intAsFloatValue) {
				return intValue;
			}
			return Std.int(intAsFloatValue);
		}
		if (~/^-?[0-9]+(\.[0-9]+)?(e\-?\d+)?$/.match(trimmed)) {
			return Std.parseFloat(trimmed);
		}
		if (~/^-?0x[0-9a-fA-F]+$/.match(trimmed)) {
			#if neko
			if (value.charAt(0) == "-") {
				// neko seems to have a bug where it returns 0 when
				// the string starts with the - character
				var intValue = Std.parseInt(value.substr(1));
				if (intValue != null) {
					return -intValue;
				}
			}
			#end
			return Std.parseInt(trimmed);
		}
		if (trimmed == VALUE_NAN) {
			return Math.NaN;
		} else if (trimmed == VALUE_INFINITY) {
			return Math.POSITIVE_INFINITY;
		} else if (trimmed == VALUE_NEGATIVE_INFINITY) {
			return Math.NEGATIVE_INFINITY;
		}
		// it can always be parsed as a string
		return value;
	}

	/**
		Attempts to parse an `EReg` value from the given string. If the string
		is not recognized as an `EReg` value, returns `null`.
	**/
	public static function parseEReg(value:String):EReg {
		value = StringTools.trim(value);
		if (value.length == 0) {
			return ~//;
		}
		// if not empty, must start with ~/ and have final / before flags
		if (~/^~\/.*?\/[a-z]*$/.match(value)) {
			var endSlashIndex = value.lastIndexOf("/");
			var expression = value.substring(2, endSlashIndex);
			var flags = value.substr(endSlashIndex + 1);
			return new EReg(expression, flags);
		}
		return null;
	}

	/**
		Attempts to parse an `Float` value from the given string. If the string
		is not recognized as an `Float` value, returns `null`.
	**/
	public static function parseFloat(value:String):Null<Float> {
		value = StringTools.trim(value);
		if (value == VALUE_NAN) {
			return Math.NaN;
		} else if (value == VALUE_INFINITY) {
			return Math.POSITIVE_INFINITY;
		} else if (value == VALUE_NEGATIVE_INFINITY) {
			return Math.NEGATIVE_INFINITY;
		}
		if (~/^-?0x[0-9a-fA-F]+$/.match(value)) {
			#if neko
			if (value.charAt(0) == "-") {
				// neko seems to have a bug where it returns 0 when
				// the string starts with the - character
				var intValue = Std.parseInt(value.substr(1));
				if (intValue != null) {
					return -intValue;
				}
			}
			#end
			return Std.parseInt(value);
		}
		if (~/^-?[0-9]+(\.[0-9]+)?(e\-?\d+)?$/.match(value)) {
			return Std.parseFloat(value);
		}
		return null;
	}

	/**
		Attempts to parse an `Int` value from the given string. If the string is
		not recognized as an `Int` value, returns `null`.
	**/
	public static function parseInt(value:String):Null<Int> {
		value = StringTools.trim(value);
		#if neko
		if (value.charAt(0) == "-") {
			// neko seems to have a bug where it returns 0 when
			// the string starts with the - character
			var intValue = Std.parseInt(value.substr(1));
			if (intValue != null) {
				return -intValue;
			}
		}
		#end
		return Std.parseInt(value);
	}

	/**
		Attempts to parse a `UInt` value from the given string. If the string is
		not recognized as a `UInt` value, returns `null`.
	**/
	public static function parseUInt(value:String):Null<UInt> {
		value = StringTools.trim(value);
		if (~/^0x[0-9a-fA-F]+$/.match(value)) {
			return Std.parseInt(value);
		}
		if (~/^[0-9]+$/.match(value)) {
			var uintValue = Std.parseInt(value);
			var uintAsFloatValue = Std.parseFloat(value);
			if (uintValue != null && uintValue == uintAsFloatValue) {
				return uintValue;
			}
			return Std.int(uintAsFloatValue);
		}
		return null;
	}
}
