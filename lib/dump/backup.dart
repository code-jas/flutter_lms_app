 Scaffold(
      backgroundColor: dark_100,
      appBar: AppBar(
        backgroundColor: default_,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(
          "LOGGED IN AS: ${user.email!}",
          style: const TextStyle(fontSize: 20, color: light_100),
        ),
      ),
    )