module vecs
import gx

// Component 
pub struct Comp1 {
pub mut:
	color 	gx.Color
}

[heap]
pub struct Comp1Map {
pub mut:
	w &World  = voidptr(0)
	e map[int]Comp1 = map[int]Comp1{}
}

// constructor comp1 map
pub fn comp1_map(w &World) &Comp1Map {
	cm := &Comp1Map{
		w: w
	}
	// println(cm.w)
	return cm
}

// get 
pub fn comp1(w &World) &Comp1Map {
	cm := w.cm[w.c["comp1"]]
	if cm is Comp1Map {
		return cm
	} else {
		//never here!
		return &Comp1Map{}
	}
}

pub fn (cm &Comp1Map) str() string {
	return cm.e.str()
}


pub fn (mut cm Comp1Map) set(ename string, comp Comp1) {
	w := cm.w
	eint := w.e[ename]
	cm.e[eint] = comp
}

pub fn (mut cm Comp1Map) get(ename string) ?Comp1 {
	w := cm.w
	eint := w.e[ename]
	if eint in cm.e {
		return cm.e[eint]
	} else {
		return none
	}
}

pub fn (mut cm Comp1Map) rm(ename string) {
	w := cm.w
	eint := w.e[ename]
	cm.e.delete(eint)
}


// Component 
pub struct Comp2 {
	x int
	y int
}
[heap]
pub struct  Comp2Map {
pub mut:
	w &World = voidptr(0)
	e map[int]Comp2
}

pub fn comp2_map(w &World) &Comp2Map {
	cm := &Comp2Map{
		w: w
	}
	// println(cm.w)
	return cm
}

pub fn comp2(w &World) &Comp2Map {
	cm := w.cm[w.c["comp2"]]
	if cm is Comp2Map {
		return cm
	} else {
		// Never here
		return &Comp2Map{}
	}
}

pub fn (mut c2m Comp2Map) set(ename string, comp Comp2) {
	w := c2m.w
	eint := w.e[ename]
	// println("add $eint $ename $comp")
	c2m.e[eint] = comp
}