package com.king.apps.gamejam.blue {

import com.king.apps.gamejam.blue.board.Board;
import com.king.apps.gamejam.blue.board.BoardBuilder;
import com.king.apps.gamejam.blue.board.TileType;

import flash.display.Sprite;
    import flash.text.TextField;

    public class BlueMain extends Sprite
    {
        private var _board : Board;


        public function BlueMain()
        {
            var textField:TextField = new TextField();
            textField.text = "Hello, World";
            addChild(textField);

            addBoard();

        }

        private function addBoard():void
        {
            _board = BoardBuilder.makeBoard(TileType.RECTANGLES);
            addChild(_board);
        }
    }
}
