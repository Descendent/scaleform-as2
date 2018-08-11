/**************************************************************************

Filename    :   Selection.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class Selection
{
	static public var alwaysEnableArrowKeys : Boolean;
	static public var alwaysEnableKeyboardPress : Boolean;
	static public var disableFocusAutoRelease : Boolean;
	static public var disableFocusKeys : Boolean;
	static public var disableFocusRolloverEvent : Boolean;
	static public var modalClip : MovieClip;
	static public var numFocusGroups : Number;

	static public function addListener(listener:Object) : Void;

	static public function getBeginIndex() : Number;

	static public function getCaretIndex() : Number;

	static public function getEndIndex() : Number;

	static public function getFocus() : String;

	static public function removeListener(listener:Object) : Void;

	static public function setFocus(newFocus:Object) : Boolean;

	static public function setSelection(beginIndex:Number, endIndex:Number) : Void;

	static public function captureFocus(doCapture:Boolean) : Void;

	static public function moveFocus(keyToSimmulate:String, startFromMovie:Object) : Object;

	static public function findFocus(keyToSimulate:String, parentMovie:Object, loop:Boolean, startFromMovie:Object, includeFocusEnabledChars:Boolean, controllerIndex:Number) : Object;

	static public function setModalClip(modalClip:Object, controllerIndex:Number) : Object;

	static public function getModalClip(controllerIndex:Number) : Void;

	static public function setControllerFocusGroup(controllerIndex:Number, focusGroupIdx:Number) : Boolean;

	static public function getControllerFocusGroup(controllerIndex:Number) : Number;

	static public function getFocusArray(mc:Object) : Array;

	static public function getFocusBitmask(mc:Object) : Number;

	static public function getControllerMaskByFocusGroup(focusGroupIdx:Number) : Number;

}