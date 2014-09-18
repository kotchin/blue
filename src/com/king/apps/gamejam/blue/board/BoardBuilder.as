package com.king.apps.gamejam.blue.board
{
    public class BoardBuilder
    {
        public function BoardBuilder() {
        }

        public static function MakeBoard(type : String, columns : int = 9, rows : int = 12) : Board
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

            return null;
        }

        private static function createRectangularTileBoard(columns : int, rows : int) : Board
        {
            var tileContainer : Vector.<Tile>;

            for (var i : int = 0; i < columns * rows; i++)
            {
                var xPosition : int = i % columns;
                var yPosition : int = i / rows;
                var tile = new Tile(xPosition,yPosition)
                if(xPosition != 0) {
                    var leftTile = tileContainer[i-1];
                    tile.AddNeighbour(leftTile);
                    leftTile.AddNeighbour(tile);
                }
                if(yPosition != 0) {
                    var aboveTile = tileContainer[i-columns];
                    tile.AddNeighbour(aboveTile);
                    aboveTile.AddNeighbour(tile);
                }
                tileContainer.push();
            }
            return new Board(tileContainer);
        }
    }
}
