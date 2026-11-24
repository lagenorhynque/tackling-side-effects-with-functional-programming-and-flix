pub mod TacklingSideEffects.AlgebraicDataType {
    pub def example_combine(): Unit \ IO =
        let resultOk = Charge.combine(
            Charge.Charge({creditCard = Charge.CreditCard.CreditCard("A"), amount = 1.0}),
            Charge.Charge({creditCard = Charge.CreditCard.CreditCard("A"), amount = 2.0})
        );
        println("Result of combining charges with the same card: ${resultOk}");
        let resultErr = Charge.combine(
            Charge.Charge({creditCard = Charge.CreditCard.CreditCard("A"), amount = 1.0}),
            Charge.Charge({creditCard = Charge.CreditCard.CreditCard("B"), amount = 2.0})
        );
        println("Result of combining charges with different cards: ${resultErr}")

    pub def example_coalesce(): Unit \ IO =
        let result = Charge.coalesce(
            List#{
                Charge.Charge({creditCard = Charge.CreditCard.CreditCard("A"), amount = 1.0}),
                Charge.Charge({creditCard = Charge.CreditCard.CreditCard("B"), amount = 2.0}),
                Charge.Charge({creditCard = Charge.CreditCard.CreditCard("A"), amount = 3.0})
            }
        );
        println("Result of coalescing charges: ${result}")

    pub def example_buyCoffee(): Unit \ IO =
        let result = Cafe.buyCoffee(Charge.CreditCard.CreditCard("A"));
        println("Result of buying a coffee: ${result}")

    pub def example_buyCoffees(): Unit \ IO =
        let result = Cafe.buyCoffees(Charge.CreditCard.CreditCard("A"), 3);
        println("Result of buying 3 coffees: ${result}")
}
