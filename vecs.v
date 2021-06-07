module vecs


// Entity is int

// Component Generic

pub fn cm<T>(w &World) &T {
	mut cm := &T{}
	cm.w = w
	println(cm.w)
	return cm
}

// DOES NOT WORK because of dynamic casting "if cm is T"
pub fn get_cm<T>(w &World, cname string) &T {
	cm := w.cm[w.c[cname]]
	if cm is T {
		return cm
	} else {
		eprintln("oups!")
		return &T{}
	}
}

interface ComponentMap {
mut:
	w &World
}


[heap]
pub struct World { 
pub mut:
	last_entity	int
	e 		map[string]int
	c 		map[string]int
	cm		[]ComponentMap 
}

pub fn world() &World {
	return &World{}
}

pub fn (mut w World) new_component(cname string, comp_map ComponentMap) {
	w.cm << comp_map
	w.c[cname] = w.cm.len - 1
}

pub fn (mut w World) new_entity(ename string) {
	w.e[ename] = w.last_entity
	w.last_entity += 1
}