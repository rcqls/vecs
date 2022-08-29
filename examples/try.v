import vecs
import gx

fn main() {
	mut world := vecs.world()

	world.new_component("comp1",vecs.comp1_map(world))
	world.new_component("comp2",vecs.comp2_map(world))
	
	world.new_entity("tutu")
	world.new_entity("titi")

	mut comp1 := vecs.comp1(world)
	comp1.set("titi",vecs.Comp1{})
	mut comp2 := vecs.comp2(world)
	comp2.set("titi",vecs.Comp2{})

	comp1.set("tutu",vecs.Comp1{gx.rgb(10,10,10)})
	
	mut c1 := comp1.get("titi") ?
	c1.color = gx.rgb(20,0,0)
	comp1.set("titi",c1)
	println(comp1.get("titi") ?)
}