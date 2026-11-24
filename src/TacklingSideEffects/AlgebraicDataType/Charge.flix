pub mod TacklingSideEffects.AlgebraicDataType.Charge {
    pub enum Charge({
        creditCard = CreditCard,
        amount     = Float64
    })

    instance ToString[Charge] {
        pub def toString(charge: Charge): String =
            let Charge({creditCard, amount}) = charge;
            "Charge({creditCard = ${creditCard}, amount = ${amount}})"
    }

    pub enum CreditCard(String) with Eq, ToString

    pub def combine(a: Charge, b: Charge): Result[String, Charge] =
        let Charge({creditCard = cardA, amount = amountA}) = a;
        let Charge({creditCard = cardB, amount = amountB}) = b;
        if (cardA == cardB)
            Ok(Charge({creditCard = cardA, amount = amountA + amountB}))
        else
            Err("Can't combine charges to different cards: cardA=${cardA}, cardB=${cardB}")

    pub def coalesce(charges: List[Charge]): Result[String, List[Charge]] =
        charges
            |> List.groupBy(match Charge({creditCard | _}) -> creditCard)
            |> Traversable.traverse(group -> Foldable.foldLeftM(combine, Nel.head(group), Nel.tail(group)))
}
