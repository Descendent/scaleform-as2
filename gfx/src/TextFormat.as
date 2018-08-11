/**************************************************************************

Filename    :   TextFormat.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class TextFormat
{
	public var align : String;
	public var blockIndent : Number;
	public var bold : Boolean;
	public var bullet : Boolean;
	public var color : Number;
	public var font : String;
	public var indent : Number;
	public var italic : Boolean;
	public var kerning : Boolean;
	public var leading : Number;
	public var leftMargin : Number;
	public var letterSpacing : Number;
	public var rightMargin : Number;
	public var size : Number;
	public var tabStops : Array;
	public var target : String;
	public var underline : Boolean;
	public var url : String;
	public var alpha : Number;

	public function TextFormat(font:String, size:Number, color:Number, bold:Boolean, italic:Boolean, underline:Boolean, url:String, target:String, align:String, leftMargin:Number, rightMargin:Number, indent:Number, leading:Number);

	public function getTextExtent(text:String, width:Number) : Object;

}