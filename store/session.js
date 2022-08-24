import fakeAvatar from "@/assets/avatar.png";

export default {
  state: () => ({
    user: {
      fullname: "Jane Doe",
      isAdmin: true,
      avatar: fakeAvatar,
    },
    accounts: [
      {
        name: "Teclab",
        id: "12829347",
      },
      {
        name: "IPP",
        id: "12829333",
      },
    ],
    currentAccount: {
      name: "Teclab",
      id: "12829347",
    }
  }),
  getters: {
    user: (state) => state.user,
    accounts: (state) => state.accounts,
    currentAccount: (state) => state.currentAccount,
  },
  mutations: {},
  actions: {},
  modules: {},
  namespaced: true,
};
