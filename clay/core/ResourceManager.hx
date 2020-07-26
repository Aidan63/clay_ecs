package clay.core;

class ResourceManager {
    final resources : Map<String, Any>;

    public function new() {
        resources = [];
    }

    @:generic public function get<T>(_class : Class<T>) : T {
        return cast resources[Type.getClassName(_class)];
    }

    @:generic public function create<T>(_resource : T) {
        resources[Type.getClassName(Type.getClass(_resource))] = _resource;

        return this;
    }

    @:generic public function remove<T>(_resource : T) {
        resources.remove(Type.getClassName(Type.getClass(_resource)));

        return this;
    }
}