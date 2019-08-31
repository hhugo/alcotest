let () =
  let open Alcotest in
  let id () = () in
  Alcotest_cli.run
    ~argv:[| ""; "test"; "--quick"; ".*-a" |]
    "suite-name"
    [ ( "test-a",
        [ test_case "Quick & passes filter" `Quick id;
          test_case "Slow & passes filter" `Slow id
        ] );
      ( "test-b",
        [ test_case "Slow & fails filter" `Slow id;
          test_case "Quick & fails filter" `Quick id
        ] )
    ]
