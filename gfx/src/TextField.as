import flash.geom.Rectangle;
/**************************************************************************

Filename    :   TextField.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic dynamic class TextField
{
	public var _alpha : Number;
	public var _height : Number;
	public var _highquality : Number;
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
	public var antiAliasType : String;
	public var autoSize : Object;
	public var background : Boolean;
	public var backgroundColor : Number;
	public var border : Boolean;
	public var borderColor : Number;
	public var bottomScroll : Number;
	public var condenseWhite : Boolean;
	public var embedFonts : Boolean;
	public var gridFitType : String;
	public var filters : Array;
	public var hscroll : Number;
	public var html : Boolean;
	public var htmlText : String;
	public var length : Number;
	public var maxChars : Number;
	public var maxhscroll : Number;
	public var maxscroll : Number;
	public var menu : ContextMenu;
	public var mouseWheelEnabled : Boolean;
	public var multiline : Boolean;
	public var password : Boolean;
	public var restrict : String;
	public var scroll : Number;
	public var selectable : Boolean;
	public var sharpness : Number;
	public var styleSheet : TextField.StyleSheet;
	public var tabEnabled : Boolean;
	public var tabIndex : Number;
	public var text : String;
	public var textColor : Number;
	public var textHeight : Number;
	public var textWidth : Number;
	public var thickness : Number;
	public var type : String;
	public var variable : String;
	public var wordWrap : Boolean;
	public var autoFit : Boolean;
	public var caretIndex : Number;
	public var focusGroup : Number;
	public var hitTestDisable : Boolean;
	public var noTranslate : Boolean;
	public var numLines : Number;
	public var topmostLevel : Boolean;
	public var inactiveSelectionBkgColor : Number;
	public var alwaysShowSelection : Boolean;
	public var noAutoSelection : Boolean;
	public var selectionBeginIndex : Number;
	public var selectionEndIndex : Number;
	public var selectionBkgColor : Number;
	public var selectionTextColor : Number;
	public var useRichTextClipboard : Boolean;
	public var inactiveSelectionTextColor : Number;
	public var fontScaleFactor : Number;
	public var textAutoSize : String;
	public var verticalAlign : String;
	public var verticalAutoSize : String;

	static public function getFontList() : Array;

	public function addListener(listener:Object) : Boolean;

	public function getDepth() : Number;

	public function getNewTextFormat() : TextFormat;

	public function getTextFormat(beginIndex:Number, endIndex:Number) : TextFormat;

	public function removeListener(listener:Object) : Boolean;

	public function removeTextField() : Void;

	public function replaceSel(newText:String) : Void;

	public function replaceText(beginIndex:Number, endIndex:Number, newText:String) : Void;

	public function setNewTextFormat(tf:TextFormat) : Void;

	public function setTextFormat() : Void;

	public function onChanged(changedField:TextField) : Void;

	public function onKillFocus(newFocus:Object) : Void;

	public function onScroller(scrolledField:TextField) : Void;

	public function onSetFocus(oldFocus:Object) : Void;

	public function appendText(newText:String) : Void;

	public function appendHtml(newHtml:String) : Void;

	public function getCharBoundaries(charIndex:Number) : Rectangle;

	public function getExactCharBoundaries(charIndex:Number) : Rectangle;

	public function getCharIndexAtPoint(x:Number, y:Number) : Number;

	public function getFirstCharInParagraph(charIndex:Number) : Number;

	public function getLineIndexAtPoint(x:Number, y:Number) : Number;

	public function getLineLength(lineIndex:Number) : Number;

	public function getLineMetrics(lineIndex:Number) : Object;

	public function getLineText(lineIndex:Number) : String;

	public function copyToClipboard(richClipboard:Boolean, startIndex:Number, endIndex:Number) : Void;

	public function cutToClipboard(richClipboard:Boolean, startIndex:Number, endIndex:Number) : Void;

	public function pasteFromClipboard(richClipboard:Boolean, startIndex:Number, endIndex:Number) : Void;

}