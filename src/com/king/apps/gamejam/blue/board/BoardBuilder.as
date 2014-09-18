package com.king.apps.gamejam.blue.board
{
    public class BoardBuilder
    {
        public function BoardBuilder() {
        }


        public static function makeBoard(type : String, columns : int = 9, rows : int = 12) : Board
        {
            switch (type)
            {
                case TileType.TRIANGLES:
                    break;

                case TileType.RECTANGLES:
                    return createRectangularTileBoard(columns, rows);
                    break;

                case TileType.HEXAGONS:
                    break;

            }

            return new Board();
        }

        private static function createRectangularTileBoard(columns : int, rows : int):Board
        {

        }

    }
}
