pub mod TacklingSideEffects.Coffee {
    pub enum Coffee({price = Float64})

    instance ToString[Coffee] {
        pub def toString(coffee: Coffee): String =
            let Coffee({price}) = coffee;
            "Coffee({price = ${price}})"
    }

    pub def make(): Coffee =
        Coffee({price = 2.0})
}
