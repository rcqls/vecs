import vecs
import gx

fn main() {
	mut world := vecs.world()

	world.new_component("comp1",vecs.comp1_map(world))
	world.new_component("comp2",vecs.comp2_map(world))
	
	world.new_entity("tutu")
	world.new_entity("titi")

	vecs.comp1(world).set("titi",vecs.Comp1{})
	vecs.comp2(world).set("titi",vecs.Comp2{})

	vecs.comp1(world).set("tutu",vecs.Comp1{gx.rgb(10,10,10)})
	
	mut c1 := vecs.comp1(world).get("titi") ?
	c1.color = gx.rgb(20,0,0)
	vecs.comp1(world).set("titi",c1)
	println(vecs.comp1(world).get("titi") ?)
}