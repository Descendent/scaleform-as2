import flash.geom.Point;
import flash.geom.Rectangle;
/**************************************************************************

Filename    :   Stage.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class Stage
{
	static public var align : String;
	static public var height : Number;
	static public var scaleMode : String;
	static public var showMenu : Boolean;
	static public var width : Number;
	static public var visibleRect : Rectangle;
	static public var safeRect : Rectangle;
	static public var originalRect : Rectangle;

	static public function addListener(listener:Object) : Void;

	static public function removeListener(listener:Object) : Boolean;

	static public function translateToScreen(pt:Object) : Point;

}