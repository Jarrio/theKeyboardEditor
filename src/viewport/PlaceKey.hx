package viewport;

class PlaceKey extends Action {
	var viewport: Viewport;
	var key: keyson.Keyson.Key;
	var keyRenderer: KeyRenderer;
	final shape: String;
	final x: Float;
	final y: Float;

	override public function new(viewport: Viewport, x: Float, y: Float, shape: String) {
		super();
		this.viewport = viewport;
		this.x = x;
		this.y = y;
		// we take shape for input what actual key to place
		this.shape = shape;
	};

	override public function act() {
		// Create a keyson key
		this.key = viewport.keyboard.addKey(shape, [x, y], shape);
		// place the ordered key
		this.keyRenderer = this.viewport.drawKey(this.key);
		// TODO apply settings
		super.act();
	}

	override public function undo() {
		this.viewport.universe.remove(this.keyRenderer);
		this.viewport.keyboard.keys.remove(this.key);
		this.keyRenderer.dispose();
	}
}
