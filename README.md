#### Download Deps
`mix deps.get`

#### Configure DB on `config/config.exs` if necessary and then run
`mix do event_store.drop, event_store.create, event_store.init`

#### Start Node A
`iex --name a@127.0.0.1 -S mix`

#### Start Node B
`iex --name b@127.0.0.1 -S mix`

#### How to trigger event that will print value on STDOUT
`HelloWorld.hello`

#### Error:
```
14:24:08.276 [error] GenServer {HelloWorld.EventStore.EventStore.Subscriptions.Registry, {"$all", "AccountBalanceHandler"}} terminating
** (stop) killed
Last message: {:DOWN, #Reference<0.172713521.479199233.88009>, :process, #PID<0.303.0>, :killed}
State: %EventStore.Subscriptions.Subscription{retry_interval: 60000, stream_uuid: "$all", subscription: %EventStore.Subscriptions.SubscriptionFsm{data: %EventStore.Subscriptions.SubscriptionState{buffer_size: 1, conn: HelloWorld.EventStore.Postgrex, event_store: HelloWorld.EventStore, last_ack: 0, last_received: 0, last_sent: 0, lock_ref: nil, mapper: &Commanded.EventStore.Adapters.EventStore.Mapper.from_recorded_event/1, max_size: 1000, partition_by: nil, partitions: %{}, processed_event_numbers: #MapSet<[]>, queue_size: 0, schema: "public", selector: nil, serializer: Commanded.Serialization.JsonSerializer, start_from: 0, stream_uuid: "$all", subscribers: %{}, subscription_id: nil, subscription_name: "AccountBalanceHandler", transient: false}, state: :unsubscribed}, subscription_name: "AccountBalanceHandler"}
```
