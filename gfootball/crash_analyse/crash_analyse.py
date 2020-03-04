import pickle
import gfootball.env as football_env

# files = ["state_2949524111894", "state_2967625968164", "state_8740717452850", "state_8749651218096", "state_8753940391337", "state_8755588872887", "state_8756517669836", "state_8763774177870", "state_8794464646222", "state_9223363242555257663", "state_9223363255406728623", "state_9223363256081316790", "state_9223363272876918093", "state_9223363273748099910", "state_9223363287726533807", "state_9223363296473768732", "state_9223363299488887580", "state_9223363305495962543", "state_9223369041665214425", "state_9223369087816248572"]

files = ["state_9223369041665214425"]

for file_name in files:
    print(rf"File:{file_name}")

    with open(file_name, "rb") as file:
        state = pickle.load(file)
    print("Got state:", sum(state[0])%10000)


def get_raw_sate(rich_state):
    state = rich_state[0]
    # First 3 bytes encodes size of state.
    size_decoded = int.from_bytes(list(state[:3]), byteorder='big')
    raw_state = state[3:(size_decoded + 3)]
    assert (state[(size_decoded + 3):] == 0).all()
    return bytes(raw_state)


raw_state = get_raw_sate(state)

env = football_env.create_environment(
            env_name='11_vs_11_easy_stochastic',
            representation='simple115',
            rewards="scoring",
            stacked=False,
            write_full_episode_dumps=False,
            write_goal_dumps=False,
        )

for _ in range(100):
    print("Restore")
    env.set_state(raw_state)
    for x in range(100):
        action = env.action_space.sample()
        print("action:", action)
        env.step(action)