defmodule HelloWorld.App do
  use Commanded.Application,
    otp_app: :hello_world,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: HelloWorld.EventStore
    ]

  router(BankRouter)
end
