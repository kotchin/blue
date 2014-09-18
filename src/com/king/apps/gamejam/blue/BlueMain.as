package com.king.apps.gamejam.blue {

import com.king.apps.gamejam.blue.board.Board;
import com.king.apps.gamejam.blue.board.BoardBuilder;
import com.king.apps.gamejam.blue.board.TileGeometryType;
import com.king.apps.gamejam.blue.resources.ResourceLoader;

import flash.display.Sprite;
    import flash.text.TextField;

    public class BlueMain extends Sprite
    {
        private var _board : Board;
        private var _resourceLoader : ResourceLoader;


        public function BlueMain()
        {
            var textField:TextField = new TextField();
            textField.text = "Hello, World";
            addChild(textField);

            loadResources();

            addBoard();

        }

        private function loadResources() : void
        {
            _resourceLoader = new ResourceLoader();
        }

        private function addBoard():void
        {
            _board = BoardBuilder.MakeBoard(TileGeometryType.RECTANGLES, _resourceLoader);
            addChild(_board);
        }
    }
}
