import flash.geom.Rectangle;
/**************************************************************************

Filename    :   Button.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class Button
{
	public var _alpha : Number;
	public var _focusrect : Boolean;
	public var _height : Number;
	public var _highquality : Number;
	public var menu : ContextMenu;
	public var _name : String;
	public var _parent : MovieClip;
	public var _quality : String;
	public var _rotation : Number;
	public var _soundbuftime : Number;
	public var _target : String;
	public var _url : String;
	public var _visible : Boolean;
	public var _width : Number;
	public var _x : Number;
	public var _xmouse : Number;
	public var _xscale : Number;
	public var _y : Number;
	public var _ymouse : Number;
	public var _yscale : Number;
	public var scale9Grid : Rectangle;
	public var enabled : Boolean;
	public var filters : Array;
	public var cacheAsBitmap : Boolean;
	public var blendMode : Object;
	public var tabEnabled : Boolean;
	public var tabIndex : Number;
	public var trackAsMenu : Boolean;
	public var useHandCursor : Boolean;
	public var hitTestDisable : Boolean;
	public var topmostLevel : Boolean;
	public var focusGroup : Number;

	public function getDepth() : Number;

	public function onDragOut() : Void;

	public function onDragOver() : Void;

	public function onKeyDown() : Void;

	public function onKeyUp() : Void;

	public function onKillFocus(newFocus:Object) : Void;

	public function onPress() : Void;

	public function onRelease() : Void;

	public function onReleaseOutside() : Void;

	public function onRollOut() : Void;

	public function onRollOver() : Void;

	public function onSetFocus(oldFocus:Object) : Void;

}