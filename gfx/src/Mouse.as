import flash.geom.Point;
/**************************************************************************

Filename    :   Mouse.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class Mouse
{
	static public var HAND : Number;
	static public var ARROW : Number;
	static public var IBEAM : Number;
	static public var LEFT : Number;
	static public var RIGHT : Number;
	static public var MIDDLE : Number;
	static public var mouseIndex : Number;

	static public function addListener(listener:Object) : Void;

	static public function hide() : Number;

	static public function removeListener(listener:Object) : Boolean;

	static public function show() : Number;

	static public function getButtonsState(mouseIndex:Number) : Number;

	static public function getTopMostEntity(arg1:Object, arg2:Number, arg3:Boolean) : Object;

	static public function getPosition(mouseIndex:Number) : Point;

	static public function setCursorType(cursorType:Number, mouseIndex:Number) : Void;

}