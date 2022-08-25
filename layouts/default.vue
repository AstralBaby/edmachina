<template>
  <v-app>
    <v-app-bar
      clipped-left
      app
      dark
      :color="$vuetify.theme.dark ? 'black' : 'primary'"
      elevation="0"
    >
      <v-app-bar-nav-icon @click="showDrawer = !showDrawer"  />
      <img
        src="@/assets/logo.svg"
        alt="Edmachina"
        class="mx-1 d-none d-md-inline"
      />
      <v-spacer />
      <v-icon>search</v-icon>
      <v-icon
        @click="$vuetify.theme.dark = false"
        class="ml-4"
        v-if="$vuetify.theme.dark"
      >
        light_mode
      </v-icon>
      <v-icon @click="$vuetify.theme.dark = true" class="ml-4" v-else>
        dark_mode
      </v-icon>
      <v-icon class="ml-4">settings</v-icon>
      <v-badge content="1" overlap color="red">
        <v-icon class="ml-4">notifications</v-icon>
      </v-badge>
      <user-menu :user="{ ...user, currentAccount, accounts }" />
    </v-app-bar>
    <v-navigation-drawer :value="showDrawer" clipped app>
      <v-list class="pa-4">
        <template v-for="(i, idx) in navItems">
          <v-subheader
            v-if="i.type === 'divider'"
            class="px-0 text-uppercase text-red mt-4"
            :key="idx"
          >
            {{ i.label }}
            <v-spacer />
            <v-icon size="14">
              {{ i.icon }}
            </v-icon>
          </v-subheader>
          <v-list-item
            v-else
            @click="currentNavItem = idx"
            class="rounded px-3 mb-2 nav-item"
            :class="{ 'nav-active': currentNavItem === idx }"
            :key="idx"
          >
            <v-list-item-content>
              <v-list-item-title
                :class="[
                  $vuetify.theme.dark
                    ? 'grey--text text--lighten-1'
                    : 'grey--text text--darken-1',
                ]"
              >
                <v-icon
                  class="mr-1"
                  :class="{
                    'white--text': currentNavItem === idx,
                  }"
                >
                  {{ i.icon }}
                </v-icon>
                {{ i.label }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>
    <v-main>
      <div class="px-10 py-5">
        <Nuxt />
      </div>
    </v-main>
    <v-footer
      app
      inset
      :class="[$vuetify.theme.dark ? 'black' : 'primary lighten-2 white--text']"
      class="text-body-2 px-7 py-4"
    >
      <div class="uppercase">COPYRIGHT © 2022</div>
      <div class="font-weight-medium ml-2">Edmachina</div>
    </v-footer>
  </v-app>
</template>

<script>
import UserMenu from "@/layouts/components/UserMenu";
import { mapGetters } from "vuex";

export default {
  name: "DefaultLayout",
  components: { UserMenu },
  data: () => ({
    showDrawer: true,
    currentNavItem: 7,
    navItems: [
      {
        icon: "home",
        label: "Dashboard",
      },
      {
        icon: "calendar_today",
        label: "Calendar",
      },
      {
        icon: "list_alt",
        label: "Reports",
        type: "divider",
      },
      {
        icon: "add_box",
        label: "Machina Hi",
      },
      {
        icon: "outbound",
        label: "Heads Up",
      },
      {
        icon: "loop",
        label: "Stay Around",
      },
      {
        icon: "analytics",
        label: "Analytics",
      },
      {
        icon: "leaderboard",
        label: "My Reports",
      },
    ],
  }),
  computed: {
    ...mapGetters("session", ["user", "accounts", "currentAccount"]),
  },
  created() {
    if (!process.client) return
    // Before the page is completely rendered, we validate if the user's browser color scheme preference is set to dark,
    // if so, we use the vuetify option to switch the main theme provider theme to dark.
    if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
      this.$vuetify.theme.dark = true;
    }

    // For some edge cases where the user switchs the browser theme preference after the app was rendered
    // we can subscribe an event listener for changes in the MediaQueryList and update the vuetify variant based on the new value.
    window
      .matchMedia("(prefers-color-scheme: dark)")
      .addEventListener("change", (newTheme) => {
        this.$vuetify.theme.dark = newTheme.matches;
      });
  },
};
</script>

<style lang="scss" scoped>
.nav-item {
  background: var(--v-background-lighten2);
  &.theme--light {
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.05);
  }
  &.nav-active {
    background: var(--v-primary-base);
    .v-icon,
    .v-list-item__title {
      color: var(--v-background-base) !important;
    }
  }
  .v-icon {
    color: inherit;
  }
}
</style>
