package com.king.apps.gamejam.blue.board
{
import flash.display.Sprite;

public class Board extends Sprite
    {
        private var _tiles : Vector.<Tile>;

        public function Board(tiles : Vector.<Tile>) {
            _tiles = tiles
            for each(var it : Tile in _tiles) {
                addChild(it);
            }
        }


    }
}
