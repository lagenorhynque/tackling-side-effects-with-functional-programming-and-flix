pub mod TacklingSideEffects.AlgebraicDataType.Cafe {
    use TacklingSideEffects.AlgebraicDataType.Charge
    use TacklingSideEffects.Coffee

    pub def buyCoffee(cc: Charge.CreditCard): (Coffee, Charge) =
        let coffee = Coffee.make();
        let Coffee.Coffee({price}) = coffee;
        let charge = Charge.Charge({creditCard = cc, amount = price});
        (coffee, charge)

    pub def buyCoffees(cc: Charge.CreditCard, n: Int32): Result[String, (List[Coffee], Charge)] =
        let (coffees, charges) = buyCoffee(cc) |> List.repeat(n) |> List.unzip;
        charges
            |> Foldable.foldLeftM(Charge.combine, Charge.Charge({creditCard = cc, amount = 0.0}))
            |> Functor.map(charge -> (coffees, charge))
}
