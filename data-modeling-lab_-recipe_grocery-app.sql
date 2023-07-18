CREATE TABLE "public.Users" (
	"user_id" serial NOT NULL,
	"email" varchar(100) NOT NULL,
	"password" varchar(32) NOT NULL,
	"username" varchar(30) NOT NULL UNIQUE,
	CONSTRAINT "Users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.UserDetails" (
	"user_detail_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"first_name" varchar(100) NOT NULL,
	"last_name" varchar(100) NOT NULL,
	"birthday" DATE,
	"location" varchar(50),
	"interests" TEXT,
	"profile_picture" varchar,
	"allergies" TEXT,
	CONSTRAINT "UserDetails_pk" PRIMARY KEY ("user_detail_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Recipes" (
	"recipe_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"instructions" TEXT NOT NULL,
	"public" BOOLEAN NOT NULL,
	"views" integer NOT NULL,
	"average_rating" DECIMAL NOT NULL,
	"difficulty" integer NOT NULL,
	"time_required" integer NOT NULL,
	"servings" integer NOT NULL,
	"allergens" varchar NOT NULL,
	CONSTRAINT "Recipes_pk" PRIMARY KEY ("recipe_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Occasions" (
	"occasion_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"occasion_name" varchar(50) NOT NULL,
	CONSTRAINT "Occasions_pk" PRIMARY KEY ("occasion_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.OccasionsRecipes" (
	"occasion_recipe_id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"occasion_id" integer NOT NULL,
	CONSTRAINT "OccasionsRecipes_pk" PRIMARY KEY ("occasion_recipe_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Ingredients" (
	"ingredient_id" serial NOT NULL,
	"ingredient_name" varchar(50) NOT NULL,
	"ingredient_price" integer NOT NULL,
	"description" TEXT NOT NULL,
	CONSTRAINT "Ingredients_pk" PRIMARY KEY ("ingredient_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.GroceryList" (
	"grocery_list_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	CONSTRAINT "GroceryList_pk" PRIMARY KEY ("grocery_list_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.FriendsRecipes" (
	"friendlist_id" serial NOT NULL,
	"user_id_1" integer NOT NULL,
	"user_id_2" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "FriendsRecipes_pk" PRIMARY KEY ("friendlist_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Reviews" (
	"review_id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"body" TEXT NOT NULL,
	"rating" integer NOT NULL,
	CONSTRAINT "Reviews_pk" PRIMARY KEY ("review_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.FavoriteRecipes" (
	"favorite_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "FavoriteRecipes_pk" PRIMARY KEY ("favorite_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.RecipeIngredients" (
	"recipe_ingredient_id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	CONSTRAINT "RecipeIngredients_pk" PRIMARY KEY ("recipe_ingredient_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "UserDetails" ADD CONSTRAINT "UserDetails_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "Recipes" ADD CONSTRAINT "Recipes_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "Occasions" ADD CONSTRAINT "Occasions_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "OccasionsRecipes" ADD CONSTRAINT "OccasionsRecipes_fk0" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipe_id");
ALTER TABLE "OccasionsRecipes" ADD CONSTRAINT "OccasionsRecipes_fk1" FOREIGN KEY ("occasion_id") REFERENCES "Occasions"("occasion_id");


ALTER TABLE "GroceryList" ADD CONSTRAINT "GroceryList_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "GroceryList" ADD CONSTRAINT "GroceryList_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "Ingredients"("ingredient_id");

ALTER TABLE "FriendsRecipes" ADD CONSTRAINT "FriendsRecipes_fk0" FOREIGN KEY ("user_id_1") REFERENCES "Users"("user_id");
ALTER TABLE "FriendsRecipes" ADD CONSTRAINT "FriendsRecipes_fk1" FOREIGN KEY ("user_id_2") REFERENCES "Users"("user_id");
ALTER TABLE "FriendsRecipes" ADD CONSTRAINT "FriendsRecipes_fk2" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipe_id");

ALTER TABLE "Reviews" ADD CONSTRAINT "Reviews_fk0" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipe_id");
ALTER TABLE "Reviews" ADD CONSTRAINT "Reviews_fk1" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "FavoriteRecipes" ADD CONSTRAINT "FavoriteRecipes_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "FavoriteRecipes" ADD CONSTRAINT "FavoriteRecipes_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipe_id");

ALTER TABLE "RecipeIngredients" ADD CONSTRAINT "RecipeIngredients_fk0" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipe_id");
ALTER TABLE "RecipeIngredients" ADD CONSTRAINT "RecipeIngredients_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "Ingredients"("ingredient_id");












