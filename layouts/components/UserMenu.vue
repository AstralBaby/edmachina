<template>
  <v-menu bottom nudge-bottom="55" rounded="lg">
    <template #activator="{ on }">
      <div class="d-flex ml-6 align-center cursor-pointer" v-on="on">
        <div class="leading-normal">
          <div>{{ user.fullname }}</div>
          <div v-show="user.isAdmin">Admin</div>
        </div>
        <v-badge
          bordered
          overlap
          color="green"
          bottom
          offset-x="15"
          offset-y="15"
        >
          <v-avatar size="50">
            <img class="object-cover" :src="user.avatar" :alt="user.fullname" />
          </v-avatar>
        </v-badge>
      </div>
    </template>
    <v-card>
      <v-list>
        <v-list-item>
          <v-list-item-avatar size="22">
            <v-icon size="22">person</v-icon>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title> Profile </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-divider />
        <v-menu
          left
          offset-x
          content-class="triangle-right attached-menu__shadow"
        >
          <template #activator="{ on }">
            <v-list-item v-on="on">
              <v-list-item-content>
                <v-list-item-title class="font-weight-semibold primary--text">
                  {{ user.currentAccount.name }}
                </v-list-item-title>
                <v-list-item-subtitle>
                  {{ user.currentAccount.id }}
                </v-list-item-subtitle>
              </v-list-item-content>
              <v-list-item-action>
                <v-icon color="primary">mdi-chevron-right</v-icon>
              </v-list-item-action>
            </v-list-item>
          </template>
          <div>
            <v-card class="elevation-0">
              <v-card-title class="accent font-weight-semibold text-body-1">
                All Accounts
              </v-card-title>
              <v-divider />
              <v-list>
                <v-list-item v-for="acc in user.accounts" :key="acc.id">
                  <v-list-item-content>
                    <v-list-item-title class="grey--text lighten-2">
                      <div class="font-weight-medium">{{ acc.name }}:</div>
                      {{ acc.id }}
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-card>
          </div>
        </v-menu>
        <v-divider />
        <v-list-item>
          <v-list-item-avatar size="22">
            <v-icon size="22">email</v-icon>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title> Inbox </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-avatar size="22">
            <v-icon size="22">notifications</v-icon>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title> Notifications </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-divider />
        <v-list-item>
          <v-list-item-avatar size="22">
            <v-icon size="22">settings</v-icon>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title> Account Settings </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-divider />
        <v-list-item>
          <v-list-item-avatar size="22">
            <v-icon size="22">receipt</v-icon>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title> Billing </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-avatar size="22">
            <v-icon size="22">logout</v-icon>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title> Logout </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-card>
  </v-menu>
</template>

<script>
export default {
  name: "UserMenu",
  props: {
    user: {
      type: Object,
      default: () => ({}),
    },
  },
  data: () => ({}),
};
</script>

<style scoped lang="scss">
.triangle-right {
  box-shadow: none;
  padding-right: 20px;
  &::after {
    display: block;
    width: 20px;
    height: 20px;
    background-color: var(--v-accent-base);
    transform: rotate(137deg);
    position: absolute;
    border-width: 1px 0px 0px 1px;
    border-style: solid;
    border-color: var(--v-background-base);
    top: 17px;
    right: 10px;
    content: "";
  }
}
</style>